# Non-functional Requirements - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Business Requirements**](business-requirements.md)
* **Non-functional Requirements**

## Non-functional Requirements

The following non-functional requirements define the minimum mandatory system capabilities necessary to support the issuance and ascertainment of validity and authenticity of an ICVP in digital format. The required functions may be implemented within existing digital services or through new services, depending on the national digital health architecture.

| | | |
| :--- | :--- | :--- |
| Immunization or Prophylaxis Registry | Confidentiality, privacy and security | Personal health information SHALL be protected from unauthorized access through appropriate role-based access controls. |
| Immunization or Prophylaxis Registry | Confidentiality, privacy and security | It SHALL be possible to support user authentication, password management, and account security controls aligned with national policies |
| Immunization or Prophylaxis Registry | Confidentiality, privacy and security | Data in transit and at rest SHALL be encrypted using secure protocols. |
| Immunization or Prophylaxis Registry | Confidentiality, privacy and security | Applicable national data protection and privacy requirements SHALL be complied with. |
| Immunization or Prophylaxis Registry | Confidentiality, privacy and security | It SHALL be possible to support secure system operations, including protection against unauthorized access and vulnerabilities. |
| Immunization or Prophylaxis Registry | Confidentiality, privacy and security | Data integrity SHALL be maintained, including prevention of partial updates and support for transaction consistency. |
| Immunization or Prophylaxis Registry | Confidentiality, privacy and security | It SHALL be possible to support privacy-preserving data handling, including anonymization where required. |
| Certificate Generation Service | Security & Trust | It SHALL be possible to cryptographically sign each ICVP in digital format using cryptographic keys controlled by the issuing authority, in accordance with applicable ICVP Trust Domain requirements, so that any alteration to the signed data after issuance can be detected. |
| Certificate Generation Service | Security & Trust | Private signing keys SHALL be protected using secure key storage and key management controls so that signing credentials are not exposed or misused. |
| Certificate Generation Service | Security & Trust | Data transmitted between the Certificate Generation Service and external systems or services SHALL be encrypted. |
| Certificate Generation Service | Security & Trust | Data at rest, including certificate data, personal data and key material, SHALL be protected from unauthorized access. |
| Certificate Generation Service | Security & Trust | Access SHALL be restricted to authorised users through appropriate authentication and access control mechanisms. |
| Certificate Generation Service | Security & Trust | Applicable data protection requirements SHALL be complied with, including applicable national data protection legislation. |
| Certificate Generation Service | Interoperability & Standards | It SHALL be possible to generate ICVPs in digital format that conform to the applicable ICVP Trust Domain specifications. |
| Certificate Generation Service | Interoperability & Standards | It SHALL be possible to make the public key material required to verify the issuerâ€™s cryptographic signature available through the GDHCN trust framework, in accordance with the applicable ICVP trust domain specifications. |
| Certificate Generation Service | Interoperability & Standards | It SHALL be possible to generate QR codes in a format compliant with ICVP trust domain specifications so that they can be processed from digital or printed representations. |
| Certificate Generation Service | Interoperability & Standards | It SHALL be possible to generate ICVPs in digital format using the applicable standardized data format and implementation specifications. |
| Status Checking Application | Security & Trust | It SHALL be possible to validate the cryptographic signature of each ICVP in digital format using trusted public key material made available through the GDHCN framework for the ICVP Trust Domain, to ensure that only certificates signed by trusted issuers are accepted. |
| Status Checking Application | Security & Trust | It SHALL be possible to retrieve and validate revocation status information (e.g. certificate revocation lists) from trusted sources, in accordance with the ICVP Trust Domain specifications, so that revoked ICVPs in digital format are identified during ascertainment of authenticity. |
| Status Checking Application | Security & Trust | Personally identifiable information from a scanned ICVP in digital format SHALL NOT be stored or transmitted beyond what is necessary for the ascertainment process |
| Status Checking Application | Security & Trust | Data transmitted to or from external services SHALL be protected through encryption in transit. |
| Status Checking Application | Security & Trust | Access SHALL be restricted to authorised users through appropriate authentication mechanisms. |
| Status Checking Application | Interoperability & Standards | It SHALL be possible to read and validate ICVPs in digital format that conform to the credential format(s) supported by the applicable ICVP Trust Domain specifications. |
| Status Checking Application | Interoperability & Standards | It SHALL be possible to retrieve, process and update trusted issuer public key material made available through the GDHCN trust framework to ensure validation against the most current list of trusted issuers. |
| Status Checking Application | Interoperability & Standards | It SHALL be possible to decode and process QR codes compliant with applicable ICVP trust domain specifications so that ICVP data can be extracted and verified from digital and printed representations. |
| Status Checking Application | Auditability & Privacy | Audit logs SHALL NOT contain unnecessary personal data unless permitted by applicable regulations. |
| Status Checking Application | Configuration & Governance | It SHALL be possible to apply and update validation rules for ICVPs in digital format in accordance with applicable IHR requirements and relevant national implementation rules. |

