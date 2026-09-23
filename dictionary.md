# Data Dictionary - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Business Requirements**](business-requirements.md)
* **Data Dictionary**

## Data Dictionary

Component 5 in the WHO Specifications and Standards for Digital ICVP outlines the minimum set of data as outlined in the Guidance related to the issuance and ascertainment of validity and authenticity of the International Certificate of Vaccination or Prophylaxis (ICVP). The data set can be used on any software system and lists the data elements relevant for service delivery and executing decision-support logic.

See the Core Data Dictionary implementation tool for the comprehensive data dictionary in spreadsheet form detailing the input options, validation checks and terminology codes.

#### Core Data Elements for Digital ICVP

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Name of the recipient of vaccine or prophylaxis | The full name of the recipient of vaccine or prophylaxis | String | R |  |  |
| Date of Birth | The date of birth of the recipient of vaccine or prophylaxis | Date | R |  |  |
| Sex | The sex of the recipient of vaccine or prophylaxis | List - select one | R |  |  |
|   Male | Recipient is male | List value |  |  |  |
|   Female | Recipient is female | List value |  |  |  |
|   Other | Recipient identifies as another sex | List value |  |  |  |
|   Unknown | Sex is not known or not specified | List value |  |  |  |
| Nationality | The nationality of the recipient of vaccine or prophylaxis | List - select one | R | ISO 3166-1 |  |
| National identification document, if applicable | Identifier of an official national identity document, where applicable | ID | O |  |  |
| Name of the parent or guardian | The full name of the parent or guardian. Required, if applicable. | String | RC |  |  |
| Vaccine or prophylaxis | Name of the vaccine or prophylaxis product administered | List - select one | R | Should be selected from WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure, or the Prequalified lists - Finished pharmaceutical products |  |
| Name of disease or condition | Name of the disease or condition for which the vaccine or prophylaxis has been administered. | List - select all that apply | R | Must correspond to the disease targeted by the selected vaccine or prophylaxis product | Derived from "Vaccine or prophylaxis" |
| Date | Date when vaccine or prophylaxis was administered | Date | R |  |  |
| Name of supervising clinician | Name of supervising clinician responsible for administering the vaccine or prophylaxis or overseeing the vaccination process. | String | C |  |  |
| Relevant authority responsible for issuing this certificate | Name of relevant authority that has been onboarded to GDHCN and is responsible for issuing this certificate, or overseeing the administering centre | List - select one | C | Must correspond to a participant included in the GDHCN trust framework (SMART Trust) ValueSet for Participants (https://worldhealthorganization.github.io/smart-trust/ValueSet-Participants.html) |  |
| Manufacturer of vaccine or prophylaxis | Name of the manufacturer of vaccine or prophylaxis administered | String | R |  | Derived from "Vaccine or prophylaxis" |
| Batch No. of vaccine or prophylaxis | Batch number of vaccine or prophylaxis administered. May be represented as a string or as a coded value. | List - select one | R |  |  |
|   Batch number (string) | Batch or lot number as recorded by the manufacturer. | String |  |  |  |
|   Batch number (coded) | Batch or lot number represented as a coded value from a predefined list, if available. | List value |  | Must be selected from a predefined list of batch or lot numbers |  |
| Certificate valid from | Date from which the certificate became valid | Date | R |  |  |
| Certificate valid until | Indicates that the certificate remains valid based on a predefined condition (e.g., lifetime validity). | List - select one | R |  |  |
|   Certificate valid until (string) | Certificate is valid for the life of the vaccinated person | String |  |  | Must correspond to lifetime validity as defined in the IHR (e.g. "life of the person vaccinated" or equivalent translation in supported languages) |
|   Certificate valid until (date) | Date until which the certificate remains valid | Date |  |  |  |
| Text following the table in the Model ICVP in Annex 6 | This certificate is valid only if the vaccine or prophylaxis used has been approved by the World Health Organization. This certificate in non-digital format must be signed by the clinician, who shall be a medical practitioner or other authorized health worker supervising the administration of the vaccine or prophylaxis. The certificate must also bear the official stamp of the administering centre; however, this shall not be an accepted substitute for the signature. Regardless of the format in which this certificate has been issued, it must bear the name of the clinician supervising the administration of the vaccine or prophylaxis, or of the relevant authority responsible for issuing the certificate or overseeing the administering centre. Any amendment of this certificate, or erasure, or failure to complete any part of it, may render it invalid. The validity of this certificate shall extend until the date indicated for the particular vaccination or prophylaxis. The certificate shall be fully completed in English or in French. The certificate may also be completed in another language on the same document, in addition to either English or French. | String | R |  |  |
| Cryptographic signature of the issuer | A digital cryptographic signature generated by the issuing authority and applied to the certificate data as part of the integrity check. | String | R |  |  |
| Key identifier for signature verification | An identifier that references the public key or trusted source required to verify the issuer's cryptographic signature as part of the integrity check. | String | R |  |  |
| Version | Identifier indicating the version of the certificate | String | R |  |  |

