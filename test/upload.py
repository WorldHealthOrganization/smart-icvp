#!/usr/bin/env python3
import argparse
import base64
import os
import sys
from pathlib import Path

import requests

def build_package_url(ig_url: str) -> str:
    # If already pointing to a package.tgz, use as-is; otherwise append /package.tgz
    if ig_url.endswith("package.tgz"):
        return ig_url
    return ig_url.rstrip("/") + "/package.tgz"

def download_package(url: str, timeout: int = 60, verify: bool = True) -> bytes:
    resp = requests.get(url, timeout=timeout, verify=verify, allow_redirects=True)
    if not (200 <= resp.status_code < 300):
        raise RuntimeError(f"Download failed ({resp.status_code}) from {url}\n{resp.text[:1000]}")
    if not resp.content:
        raise RuntimeError("Downloaded package is empty.")
    return resp.content

def install_package(host: str, token: str | None, b64payload: str, timeout: int = 90, verify: bool = True):
    url = host.rstrip("/") + "/ImplementationGuide/$install"
    headers = {
        "Accept": "application/fhir+json",
        "Content-Type": "application/fhir+json",
    }
    if token:
        headers["Authorization"] = f"Bearer {token}"
    params_resource = {
        "resourceType": "Parameters",
        "parameter": [
            {"name": "npmContent", "valueBase64Binary": b64payload}
        ],
    }
    resp = requests.post(url, json=params_resource, headers=headers, timeout=timeout, verify=verify)
    ok = 200 <= resp.status_code < 300
    print(f"[{'OK' if ok else 'ERR'}] POST {url} -> {resp.status_code}")
    if not ok:
        print(resp.text[:2000])
    return ok, resp

def main():
    parser = argparse.ArgumentParser(
        description="Download a FHIR IG package.tgz and install it via ImplementationGuide/$install."
    )
    parser.add_argument(
        "--ig-url",
        required=True,
        help="FHIR IG base URL or direct URL to package.tgz (e.g., https://example.org/ig).",
    )
    parser.add_argument(
        "--host",
        required=False,
        default="http://localhost:8080/fhir",
        help="Base FHIR server URL (default: http://localhost:8087/matchboxv3/fhir)",
    )
    parser.add_argument(
        "--token",
        default=os.environ.get("FHIR_TOKEN"),
        help="Bearer token for the FHIR server (or set FHIR_TOKEN env var).",
    )
    parser.add_argument(
        "--save",
        default=None,
        help="Optional path to save the downloaded package.tgz.",
    )
    parser.add_argument(
        "--timeout",
        type=int,
        default=60,
        help="Download timeout in seconds (default: 60).",
    )
    parser.add_argument(
        "--insecure",
        action="store_true",
        help="Disable TLS verification for HTTPS (use only for testing).",
    )
    args = parser.parse_args()

    verify = not args.insecure

    pkg_url = build_package_url(args.ig_url)
    print(f"[1/2] Downloading: {pkg_url}")
    try:
        data = download_package(pkg_url, timeout=args.timeout, verify=verify)
    except Exception as e:
        print(f"[ERR] {e}")
        sys.exit(1)

    if args.save:
        try:
            Path(args.save).parent.mkdir(parents=True, exist_ok=True)
            Path(args.save).write_bytes(data)
            print(f"      Saved package to {args.save} ({len(data)} bytes)")
        except Exception as e:
            print(f"[WARN] Could not save file: {e}")

    b64payload = base64.b64encode(data).decode("ascii")

    print(f"[2/2] Installing on {args.host.rstrip('/')}/ImplementationGuide/$install")
    ok, _ = install_package(args.host, args.token, b64payload, verify=verify)
    sys.exit(0 if ok else 2)

if __name__ == "__main__":
    try:
        import requests  # ensure installed
    except Exception:
        print("This script requires the 'requests' package. Install with: pip install requests")
        sys.exit(1)
    main()
