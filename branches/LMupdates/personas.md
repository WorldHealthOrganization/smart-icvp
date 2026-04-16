# Generic Personas - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Business Requirements**](business-requirements.md)
* **Generic Personas**

## Generic Personas

This page includes a depiction of end-users and related stakeholders as introduced in the WHO Specifications and Standards for Digital ICVP.

### Targeted generic personas

The targeted personas for the specifications and standards for ICVP in digital format represent the individuals, organizational actors, and digital services that are involved in the processes of issuance and ascertainment of validity and authenticity of the digital ICVP.

**Table 3. Descriptions of key generic personas**

| | | | |
| :--- | :--- | :--- | :--- |
| Traveller | An individual who receives vaccination or prophylaxis and requires an ICVP for international travel. | Client, Individual, ICVP holder, Caregiver or Guardian (when holding someone else's certificate) | N/A |
| Vaccination provider / issuing authority | A trained health professional or authorized personnel at a vaccination centre or public health agency responsible for administering vaccines and/or issuing ICVPs in accordance with national regulations and the International Health Regulations (2005). | Vaccinator, Nurse, Clinician, Clerical staff, Public Health Officer, Health worker, Authorized issuer | 2211; 2212; 2221 |
| National Public Health Authority (PHA) | The entity responsible for establishing policies and overseeing activities related to vaccination, ICVP issuance, and participation in international trust frameworks such as the GDHCN. | Ministry of Health, Department of Health | N/A |
| Border Health Inspector | An individual stationed at a point of entry (airport, seaport, or land border) responsible for reviewing health documents, including ICVPs, to ascertain their validity and authenticity as part of public health control measures under the IHR (2005). | Port Health Officer, Public Health Inspector, Border Inspector, Customs Health Officer | 3351; 2260 |

### Digital services supporting ICVP

The digital services supporting the issuance and ascertainment of validity and authenticity of an ICVP in digital format represent the core technical components that support or conduct the workflows presented in this document.

**Table 4. Digital services supporting ICVP**

| | | |
| :--- | :--- | :--- |
| Status Checking Application | A digital solution that can inspect, cryptographically verify and ascertain the validity and authenticity of the ICVP. This can be an application on a mobile phone or another device. | Verification application, Verifier application, ICVP verifier |
| Certificate Generation Service | A service responsible for taking validated vaccination data, converting it into a standardized digital ICVP format, applying a cryptographic signature using the issuing authority's keys, and returning the signed digital ICVP to the requesting digital service. | N/A |
| Electronic Immunization Registry (EIR) | Computerized, individualized immunization registries that facilitate monitoring, tracking, and maintenance of vaccination records. The EIR serves as the source of vaccination data used for digital ICVP issuance. | EMR, EHR, Point of Care application, Digital Health Solution |

