#!/usr/bin/env python3
import argparse
import json
import os
from pathlib import Path
import sys
import time

try:
    import requests
except Exception:
    print("This script requires the 'requests' package. Install with: pip install requests")
    sys.exit(1)

def hdrs(accept=None, content_type=None, token=None, origin=None):
    h = {}
    if accept:
        h["Accept"] = accept
    if content_type:
        h["Content-Type"] = content_type
    if token:
        h["Authorization"] = f"Bearer {token}"
    if origin:
        h["Origin"] = origin
    return h

def show_err(resp, limit=1200):
    txt = (resp.text or "")[:limit]
    print(f"   Body: {txt}")

def backoff_sleep(attempt):
    # small linear backoff
    time.sleep(0.5 * attempt)

def get_json(path: Path):
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except Exception as e:
        raise RuntimeError(f"Failed to parse JSON {path}: {e}")

def step_server_ready(host, token, origin, fhir_version, retries=3):
    url = host.rstrip("/") + "/metadata"
    accept = f"application/fhir+xml;fhirVersion={fhir_version}"
    print(f"\n[1/8] Checking server: GET {url}")
    for i in range(1, retries+1):
        try:
            r = requests.get(url, headers=hdrs(accept=accept, token=token, origin=origin), timeout=15)
            if 200 <= r.status_code < 300:
                print(f"   OK {r.status_code}")
                return True
            print(f"   Attempt {i}: ERR {r.status_code}")
            show_err(r)
        except Exception as e:
            print(f"   Attempt {i}: ERR {e}")
        backoff_sleep(i)
    return False

def step_check_sd_by_url(host, token, sd_url):
    if not sd_url:
        print("\n[2/8] Skip SD exists-check (no --sd-url provided).")
        return
    url = host.rstrip("/") + f"/StructureDefinition"
    params = {"url": sd_url}
    print(f"\n[2/8] Check SD exists by canonical URL: GET {url}?url={sd_url}")
    try:
        r = requests.get(url, params=params, headers=hdrs(accept="application/fhir+json", token=token), timeout=30)
        if 200 <= r.status_code < 300:
            try:
                bundle = r.json()
            except Exception:
                bundle = None
            total = (bundle or {}).get("total")
            print(f"   OK {r.status_code} (total={total})")
        else:
            print(f"   ERR {r.status_code}")
            show_err(r)
    except Exception as e:
        print(f"   ERR {e}")

def step_post_value_sets(host, token, fhir_version, vs_folder):
    ct = f"application/fhir+json;fhirVersion={fhir_version}"
    url = host.rstrip("/") + "/ValueSet"
    print(f"\n[3/8] POST ValueSets from {vs_folder} to {url}")
    folder = Path(vs_folder)
    files = sorted(folder.glob("*.json"))
    if not files:
        files = sorted(folder.rglob("*.json"))
    if not files:
        print(f"   No ValueSet JSON files found under {vs_folder}.")
        return
    for fp in files:
        try:
            data = fp.read_text(encoding="utf-8")
        except Exception as e:
            print(f"   [SKIP] {fp.name}: {e}")
            continue
        try:
            r = requests.post(url, data=data.encode("utf-8"),
                              headers=hdrs(accept="application/fhir+json", content_type=ct, token=token),
                              timeout=60)
            ok = 200 <= r.status_code < 300
            print(f"   [{'OK' if ok else 'ERR'}] {fp.name} -> {r.status_code}")
            if not ok:
                show_err(r)
        except Exception as e:
            print(f"   [ERR] {fp.name}: {e}")

def step_post_structure_definitions(host, token, fhir_version, sd_folder):
    ct = f"application/fhir+json;fhirVersion={fhir_version}"
    url = host.rstrip("/") + "/StructureDefinition"
    print(f"\n[4/8] POST StructureDefinitions from {sd_folder} to {url}")
    folder = Path(sd_folder)
    files = sorted(folder.glob("*.json"))
    if not files:
        files = sorted(folder.rglob("*.json"))
    if not files:
        print(f"   No JSON files found under {sd_folder}.")
        return
    for fp in files:
        try:
            data = fp.read_text(encoding="utf-8")
        except Exception as e:
            print(f"   [SKIP] {fp.name}: {e}")
            continue
        try:
            r = requests.post(url, data=data.encode("utf-8"),
                              headers=hdrs(accept="application/fhir+json", content_type=ct, token=token),
                              timeout=60)
            ok = 200 <= r.status_code < 300
            print(f"   [{'OK' if ok else 'ERR'}] {fp.name} -> {r.status_code}")
            if not ok:
                show_err(r)
        except Exception as e:
            print(f"   [ERR] {fp.name}: {e}")

def step_validate_example(host, token, profile_url, example_json_path):
    if not profile_url or not example_json_path:
        print("\n[5/8] Skip $validate (need --profile-url and --validate-json).")
        return
    url = host.rstrip("/") + f"/$validate"
    qp = {"profile": profile_url}
    print(f"\n[5/8] Validate example: POST {url}?profile={profile_url}")
    try:
        body = Path(example_json_path).read_text(encoding="utf-8")
    except Exception as e:
        print(f"   [ERR] Cannot read example JSON: {e}")
        return
    try:
        r = requests.post(
            url,
            params=qp,
            data=body.encode("utf-8"),
            headers=hdrs(
                accept="application/json",
                content_type="application/fhir+json",
                token=token,
            ),
            timeout=60,
        )
        ok = 200 <= r.status_code < 300
        print(f"   [{'OK' if ok else 'ERR'}] -> {r.status_code}")
        if not ok:
            show_err(r)
            return

        try:
            outcome = r.json()
        except Exception:
            print("   [WARN] Could not parse OperationOutcome JSON.")
            return

        issues = outcome.get("issue", [])
        fatal_errs = [i for i in issues if i.get("severity") in ("fatal", "error")]
        if fatal_errs:
            print(f"   Validation returned {len(fatal_errs)} fatal/error issues:")
            for i, issue in enumerate(fatal_errs, 1):
                sev = issue.get("severity")
                code = issue.get("code")
                locs = ", ".join(issue.get("location", []))
                details = (
                    (issue.get("details") or {}).get("text")
                    or issue.get("diagnostics")
                    or ""
                )
                print(f"    {i}. [{sev.upper()}] code={code} location={locs}")
                if details:
                    print(f"       Details: {details}")
        else:
            print("   No fatal or error issues detected, the validation has passed.")
    except Exception as e:
        print(f"   [ERR] {e}")

def step_post_structuremaps(host, token, maps_folder):
    url = host.rstrip("/") + "/StructureMap"
    print(f"\n[6/8] POST StructureMaps from {maps_folder} to {url}")
    folder = Path(maps_folder)
    files = sorted(folder.glob("*.map"))
    if not files:
        files = sorted(folder.rglob("*.map"))
    if not files:
        print(f"   No .map files found under {maps_folder}.")
        return
    for fp in files:
        try:
            txt = fp.read_text(encoding="utf-8")
        except Exception as e:
            print(f"   [SKIP] {fp.name}: {e}")
            continue
        try:
            r = requests.post(url, data=txt.encode("utf-8"),
                              headers=hdrs(accept="application/fhir+json", content_type="text/fhir-mapping", token=token),
                              timeout=60)
            ok = 200 <= r.status_code < 300
            print(f"   [{'OK' if ok else 'ERR'}] {fp.name} -> {r.status_code}")
            if not ok:
                show_err(r)
        except Exception as e:
            print(f"   [ERR] {fp.name}: {e}")

def step_transform(host, token, structuremap_url, input_json_path, out_path=None):
    if not structuremap_url or not input_json_path:
        print("\n[7/8] Skip $transform (need --sm-url and --transform-json).")
        return None
    url = host.rstrip("/") + "/StructureMap/$transform"
    qp = {"source": structuremap_url}
    print(f"\n[7/8] Transform: POST {url}?source={structuremap_url}")
    try:
        body = Path(input_json_path).read_text(encoding="utf-8")
    except Exception as e:
        print(f"   [ERR] Cannot read transform input JSON: {e}")
        return None
    try:
        r = requests.post(url, params=qp, data=body.encode("utf-8"),
                          headers=hdrs(accept="application/fhir+json", content_type="application/fhir+json", token=token),
                          timeout=90)
        ok = 200 <= r.status_code < 300
        print(f"   [{'OK' if ok else 'ERR'}] -> {r.status_code}")
        if not ok:
            show_err(r)
            return None

        try:
            out = r.json()
            print(f"   Result resourceType: {out.get('resourceType')}")
            if 'id' in out:
                print(f"   Result id: {out.get('id')}")
            if out_path:
                Path(out_path).write_text(json.dumps(out, indent=2, ensure_ascii=False), encoding="utf-8")
                print(f"   Saved transformation result to {out_path}")
            return out
        except Exception:
            print("   [WARN] Could not parse JSON result.")
            return None
    except Exception as e:
        print(f"   [ERR] {e}")
        return None


def step_validate_doc(host, token, profile_url, doc, label="Transformed document"):
    if not profile_url or not doc:
        print("\n[NEW] Skip validation of transformed doc (missing profile or document).")
        return
    url = host.rstrip("/") + f"/$validate"
    qp = {"profile": profile_url}
    print(f"\n[NEW] Validate {label} against profile: POST {url}?profile={profile_url}")
    try:
        body = json.dumps(doc, ensure_ascii=False)
    except Exception as e:
        print(f"   [ERR] Could not serialize document for validation: {e}")
        return
    try:
        r = requests.post(
            url,
            params=qp,
            data=body.encode("utf-8"),
            headers=hdrs(
                accept="application/json",
                content_type="application/fhir+json",
                token=token,
            ),
            timeout=60,
        )
        ok = 200 <= r.status_code < 300
        print(f"   [{'OK' if ok else 'ERR'}] -> {r.status_code}")
        if not ok:
            show_err(r)
            return

        try:
            outcome = r.json()
        except Exception:
            print("   [WARN] Could not parse OperationOutcome JSON.")
            return

        issues = outcome.get("issue", [])
        fatal_errs = [i for i in issues if i.get("severity") in ("fatal", "error")]
        if fatal_errs:
            print(f"   Validation returned {len(fatal_errs)} fatal/error issues:")
            for i, issue in enumerate(fatal_errs, 1):
                sev = issue.get("severity")
                code = issue.get("code")
                locs = ", ".join(issue.get("location", []))
                details = (
                    (issue.get("details") or {}).get("text")
                    or issue.get("diagnostics")
                    or ""
                )
                print(f"    {i}. [{sev.upper()}] code={code} location={locs}")
                if details:
                    print(f"       Details: {details}")
        else:
            print("   No fatal or error issues detected, the validation has passed.")
    except Exception as e:
        print(f"   [ERR] {e}")


def step_summary():
    print("\n[8/8] Done.")

def main():
    parser = argparse.ArgumentParser(
        description="End-to-end loader: check server, check SD by URL, POST ValueSets, POST StructureDefinitions, validate, POST StructureMaps, and transform."
    )
    parser.add_argument(
        "--host",
        required=False,
        default="http://localhost:8087/matchboxv3/fhir",
        help="Base FHIR server URL, e.g. http://localhost:8080/fhir",
    )
    parser.add_argument(
        "--token",
        default=os.environ.get("FHIR_TOKEN"),
        help="Bearer token (or set FHIR_TOKEN env var).",
    )
    parser.add_argument(
        "--origin",
        default="http://localhost",
        help="Optional Origin header used on the metadata request.",
    )
    parser.add_argument(
        "--fhir-version",
        default="4.0",
        help="FHIR version for Accept/Content-Type suffix (e.g., 4.0, 4.0.1, 4.3.0, 5.0.0).",
    )

    # Step 2 (exists check)
    parser.add_argument(
        "--sd-url",
        default="http://smart.who.int/icvp/StructureDefinition/ICVPMin",
        help="Canonical URL to the input StructureDefinition.",
    )

    # NEW: Step 3 (POST ValueSets)
    parser.add_argument(
        "--vs-folder",
        default="./ValueSet",
        help="Folder containing ValueSet JSON files to POST (searched recursively if needed).",
    )

    # Step 4 (POST SDs)
    parser.add_argument(
        "--sd-folder",
        default="./StructureDefinition",
        help="Folder containing StructureDefinition JSON files to POST (searched recursively if needed).",
    )

    # Step 5 (validate)
    parser.add_argument(
        "--profile-url",
        default="http://smart.who.int/icvp/StructureDefinition/DVCPayload",
        help="Profile to validate against (used as $validate?profile=...).",
    )
    parser.add_argument(
        "--validate-json",
        default="./icvp-content.json",
        help="Path to the JSON example to validate.",
    )

    # Step 6 (POST StructureMaps)
    parser.add_argument(
        "--maps-folder",
        default="./StructureMap",
        help="Folder containing .map files to POST.",
    )

    # Step 7 (transform)
    parser.add_argument(
        "--sm-url",
        default="http://smart.who.int/icvp/StructureMap/ICVPClaimtoIPS",
        help="Canonical URL of the StructureMap for $transform (source=...).",
    )
    parser.add_argument(
        "--transform-json",
        default="./icvp-content.json",
        help="Path to the JSON input used for $transform.",
    )

    parser.add_argument(
        "--transform-out",
        default="./transform-result.json",
        help="Path to save the JSON result of the $transform operation.",
    )

    parser.add_argument(
        "--transform-validate-profile",
        default="http://hl7.org/fhir/uv/ips/StructureDefinition/Bundle-uv-ips",
        help="Profile URL to validate the transformation result against.",
    )

    args = parser.parse_args()

    ok = step_server_ready(args.host, args.token, args.origin, args.fhir_version)
    if not ok:
        print("Server did not respond as ready; continuing anyway...")

    step_check_sd_by_url(args.host, args.token, args.sd_url)
    step_check_sd_by_url(args.host, args.token, "http://hl7.org/fhir/uv/trust-phw/StructureDefinition/HealthLinkPayload")
   
    step_post_value_sets(args.host, args.token, args.fhir_version, args.vs_folder)
    step_post_structure_definitions(args.host, args.token, args.fhir_version, args.sd_folder)
    step_validate_example(args.host, args.token, args.profile_url, args.validate_json)
    # step_post_structuremaps(args.host, args.token, args.maps_folder)
    result_doc = step_transform(args.host, args.token, args.sm_url, args.transform_json, args.transform_out)
    # NEW: validate the transformation result against IPS Bundle profile
    step_validate_doc(args.host, args.token, args.transform_validate_profile, result_doc, label="Transformation result")
    step_summary()

if __name__ == "__main__":
    main()
