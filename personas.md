# Generic Personas - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Business Requirements**](business-requirements.md)
* **Generic Personas**

## Generic Personas

This page includes a depiction of end-users and related stakeholders as introduced in the WHO Digital Adaptation Kit for Digital ICVP.

### Digital services

The digital services needed to support the issuance and ascertainment of validity and authenticity of an ICVP in digital format include:

| | | | |
| :--- | :--- | :--- | :--- |
| Immunization or Prophylaxis Registry | To support the issuance of an ICVP in digital format, there needs to be a digital service that collects and manages individual vaccination and/or prophylaxis records to serve as the source of vaccination or prophylaxis event data that would enable the generation of the ICVP in digital format by providing validated data to the **Certificate Generation Service**. It is at the discretion of the State Party, based on the national health enterprise architecture, what system to use as the source of vaccination or prophylaxis event data. In the context of the ICVP in digital format, this digital service can be filled with digital systems such as an electronic immunization registry (EIR), electronic medical record (EMR) system, an electronic health record (EHR) system, a community health information system, a dedicated point of care application or other. Where non-digital ascertainment of authenticity is necessary, the Immunization or Prophylaxis Registry may be consulted to determine whether the ICVP was issued to the traveller present. |  |  |
| Certificate Generation Service | A digital service that receives vaccination or prophylaxis data from an authorized source (i.e. the **Immunization or Prophylaxis Registry**), checks the data for completeness and conformance with the applicable ICVP data structure and certificate schema, converts the data into a standardized digital format (e.g. Health Level Seven International (HL7) Fast Healthcare Interoperability Resources (FHIR)), applies a cryptographic signature, and returns the signed ICVP to the issuing authority or traveller. The cryptographically signed document represents the ICVP in digital format. It is at the discretion of the State Party, based on the national health enterprise architecture, what system to use as a Certificate Generation Service. |  |  |
| Status Checking Application | Also sometimes referred to as a “verifier application”, or “ICVP verifier”. The Status Checking Application is a digital solution that can inspect, cryptographically verify, and ascertain the validity and authenticity of an ICVP in digital format using predefined acceptance criteria or business rules. This can be an application on a mobile phone or otherwise, and it can operate online or offline. It is at the discretion of the State Party, based on the national health enterprise architecture, what system to use as a Status Checking Application. |  |  |
| WHO Terminology Service | WHO hosted terminology service used for handling codesystems and valuesets used by national systems | WHO TS, TS |  |

