This page defines the principal legal, operational, and technical concepts used in this implementation guide. The definitions are aligned with WHO guidance related to the issuance and ascertainment of validity and authenticity of the International Certificate of Vaccination or Prophylaxis (ICVP) in non-digital and digital formats.

## Concepts

| Term | Definition |
|---|---|
| Amended Model ICVP | The “Model International Certificate of Vaccination or Prophylaxis” contained in Annex 6 of the International Health Regulations (2005), as amended through resolution WHA77.17 (2024). |
| Ascertainment | The process of determining whether an ICVP meets the applicable requirements through visual inspection, QR-code scanning, and/or communication with the issuing State Party. |
| Authenticity | One or more features of an ICVP indicating that it was genuinely issued, was not counterfeited or forged, and is free from alteration or falsification. |
| Certificate Generation Service | A digital service that generates an ICVP in digital format from authorized vaccination or prophylaxis information and applies the cryptographic signature of the issuing authority. |
| Cryptographic signature | A digital signature applied to certificate data by the issuing authority to support confirmation of the origin and integrity of an ICVP in digital format. |
| Data dictionary | A centralized repository of information about data elements, including their definitions, relationships, origin, use, and data types. |
| Data element | A unit of data that has a specific and precise meaning. |
| Functional requirement | A capability or function that a digital service must support to enable the issuance or ascertainment of validity and authenticity of an ICVP in digital format. |
| Global Digital Health Certification Network (GDHCN) | The WHO-governed trust network and open, interoperable digital public infrastructure that facilitates the verification and secure exchange of Verifiable Digital Health Certificates issued and used by GDHCN Participants. |
| ICVP format | The manner in which an ICVP is issued: either as a non-digital document on paper or as a digital credential issued through a digital system. |
| ICVP in digital format | An ICVP issued by a digital system authorized by a State Party as part of its onboarding to the GDHCN ICVP Trust Domain. It is represented by a QR code containing a cryptographic signature and conforms to the applicable ICVP Trust Domain requirements. |
| ICVP in non-digital format | An ICVP issued on paper that carries a wet-ink signature wherever a signature or mark is required and a wet-ink stamp wherever a stamp is required under the Model ICVP in Annex 6 of the IHR. |
| ICVP Trust Domain | The Trust Domain within the GDHCN dedicated to supporting the issuance and ascertainment of validity and authenticity of ICVPs in digital format. |
| Immunization or Prophylaxis Registry | An authorized digital source that records the vaccination or prophylaxis information required to generate an ICVP in digital format. |
| Model ICVP | The “Model International Certificate of Vaccination or Prophylaxis” contained in Annex 6 of the IHR. |
| Non-amended Model ICVP | The “Model International Certificate of Vaccination or Prophylaxis” contained in Annex 6 of the IHR, as amended through resolutions WHA67.13 (2014) and WHA75.12 (2022). |
| Non-functional requirement | An attribute or characteristic that a digital service must meet to support its secure, reliable, interoperable, and appropriate operation. |
| Public key | The publicly shareable component of a cryptographic key pair used to validate a digital signature created with the corresponding private key. |
| Revocation status information | Trusted information used to determine whether an ICVP in digital format or a certificate used in its trust chain has been revoked. |
| Selective disclosure | A process that enables a traveller to display only the specific data required for inspection without disclosing additional or unrelated information. |
| SHALL | When written in uppercase, indicates a technical feature or function that is mandatory for this specification. |
| Status Checking Application | A digital service that reads an ICVP in digital format and supports the ascertainment of its validity and authenticity, including processing its QR code, validating its cryptographic signature, applying validation rules, and checking revocation status information where applicable. |
| Traveller | A natural person undertaking an international voyage, as defined in Article 1 of the IHR. |
| Trust Domain | A GDHCN Trust Domain consists of: (1) defined use cases and business processes related to the use of Verifiable Digital Health Certificates; (2) open, interoperable technical specifications identifying or defining the applicable Trusted Services and Verifiable Digital Health Certificates; and (3) policy and regulatory standards describing the expected behaviour of GDHCN Participants in operating the Trusted Services and using Verifiable Digital Health Certificates. |
| User interface | The visual and interactive components through which users interact with a digital system, including its visual design, usability, accessibility, and on-screen controls. |
| Validity | The conformity of the features, format, and content of an ICVP to the Model ICVP applicable to the issuing State Party. |
| Verifiable Digital Health Certificate | A digital representation of a data set comprising a certificate or document designed for specified clinical or public-health use cases, defined using open and interoperable digital health standards, containing or associated with a digital signature that can be validated using the public key of a public-private cryptographic key pair, and issued by a GDHCN Participant. |
| Verifier | An authorized person or digital service that examines an ICVP, visually or digitally, to ascertain its validity, authenticity, and integrity for international travel or public-health control measures. |

## Abbreviations

| Abbreviation | Meaning |
|---|---|
| CQL | Clinical Quality Language |
| EIR | Electronic immunization registry |
| EMR | Electronic medical record |
| FHIR | Fast Healthcare Interoperability Resources |
| GDHCN | Global Digital Health Certification Network |
| HL7 | Health Level Seven International |
| ICAO | International Civil Aviation Organization |
| ICVP | International Certificate of Vaccination or Prophylaxis |
| ID | Identification |
| IHR | International Health Regulations (2005), as amended through resolutions WHA67.13 (2014), WHA75.12 (2022), and WHA77.17 (2024), unless otherwise specified |
| IMO | International Maritime Organization |
| IPS | International Patient Summary |
| NFP | National Focal Point |
| PKI | Public key infrastructure |
| QR | Quick response code |
| SMART | Standards-based, Machine-readable, Adaptive, Requirements-based, and Testable |
| WHA | World Health Assembly |
| WHO | World Health Organization |

