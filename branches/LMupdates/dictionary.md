# Data Dictionary - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Business Requirements**](business-requirements.md)
* **Data Dictionary**

## Data Dictionary

Component 5 in the WHO Specifications and Standards for Digital ICVP outlines the minimum set of data as outlined in the Guidance related to the issuance and ascertainment of validity and authenticity of the International Certificate of Vaccination or Prophylaxis (ICVP). The data set can be used on any software system and lists the data elements relevant for service delivery and executing decision-support logic.

See the Core Data Dictionary implementation tool for the comprehensive data dictionary in spreadsheet form detailing the input options, validation checks and terminology codes.

#### Core Data Elements for Digital ICVP

| | | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| ICVP.A9 | Create traveller record | ICVP.A9.DE.1 | Name of the recipient of vaccine or prophylaxis | The full name of the recipient of vaccine or prophylaxis | String | R |  |  |
| ICVP.A9 | Create traveller record | ICVP.A9.DE.2 | Date of Birth | The date of birth of the recipient of vaccine or prophylaxis | Date | R |  |  |
| ICVP.A9 | Create traveller record | ICVP.A9.DE.3 | Sex | The sex of the recipient of vaccine or prophylaxis | List - select one | R |  |  |
|  |  | ICVP.A9.DE.4 |   Male | Recipient is male | List value |  |  |  |
|  |  | ICVP.A9.DE.5 |   Female | Recipient is female | List value |  |  |  |
|  |  | ICVP.A9.DE.6 |   Other | Recipient identifies as another sex | List value |  |  |  |
|  |  | ICVP.A9.DE.7 |   Unknown | Sex is not known or not specified | List value |  |  |  |
| ICVP.A9 | Create traveller record | ICVP.A9.DE.8 | Nationality | The nationality of the recipient of vaccine or prophylaxis | List - select one | R |  |  |
| ICVP.A9 | Create traveller record | ICVP.A9.DE.9 | National identification document, if applicable | Identifier of an official national identity document, where applicable | ID | O |  |  |
| ICVP.A9 | Create traveller record | ICVP.A9.DE.10 | Name of the parent or guardian | The full name of the parent or guardian. Required, if applicable. | String | RC |  |  |
| ICVP.C5 | Enter vaccination data in EIR | ICVP.C5.DE.11 | Vaccine or prophylaxis | Name of the vaccine or prophylaxis product administered | List - select one | R | Should be selected from WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure, or the Prequalified lists - Finished pharmaceutical products |  |
| ICVP.C5 | Enter vaccination data in EIR | ICVP.C5.DE.12 | Name of disease or condition | Name of the disease or condition for which the vaccine or prophylaxis has been administered. | List - select all that apply | R | Must correspond to the disease targeted by the selected vaccine or prophylaxis product | Derived from "Vaccine or prophylaxis" |
| ICVP.C5 | Enter vaccination data in EIR | ICVP.C5.DE.13 | Date | Date when vaccine or prophylaxis was administered | Date | R |  |  |
| ICVP.C5 | Enter vaccination data in EIR | ICVP.C5.DE.14 | Name of supervising clinician | Name of supervising clinician responsible for administering the vaccine or overseeing the vaccination process. | String | C |  |  |
| ICVP.C5 OR ICVP.D5 | Enter vaccination data in EIR OR Generate and sign digital ICVP | ICVP.C5.DE.15 | Relevant authority responsible for issuing this certificate | Name of relevant authority that has been onboarded to GDHCN and is responsible for issuing this certificate, or overseeing the administering centre | List - select one | C | Must correspond to a participant included in the GDHCN trust framework (SMART Trust) |  |
| ICVP.C5 | Enter vaccination data in EIR | ICVP.C5.DE.16 | Manufacturer of vaccine or prophylaxis | Name of the manufacturer of vaccine or prophylaxis administered | String | R |  | Derived from "Vaccine or prophylaxis" |
| ICVP.C5 | Enter vaccination data in EIR | ICVP.C5.DE.17 | Batch No. of vaccine or prophylaxis | Batch number of vaccine or prophylaxis administered. May be represented as a string or as a coded value. | List - select one | R |  |  |
|  |  | ICVP.C5.DE.18 |   Batch number (string) | Batch or lot number as recorded by the manufacturer. | String |  |  |  |
|  |  | ICVP.C5.DE.19 |   Batch number (coded) | Batch or lot number represented as a coded value from a predefined list, if available. | List value |  | Must be selected from a predefined list of batch or lot numbers |  |
| ICVP.D5 | Generate and sign digital ICVP | ICVP.D5.DE.20 | Certificate valid from | Date from which the certificate became valid | Date | R |  |  |
| ICVP.D5 | Generate and sign digital ICVP | ICVP.D5.DE.21 | Certificate valid until | Indicates that the certificate remains valid based on a predefined condition (e.g., lifetime validity). | List - select one | R |  |  |
|  |  | ICVP.D5.DE.22 |   Certificate valid until (string) | Certificate is valid for the life of the vaccinated person | String |  |  | Must correspond to lifetime validity as defined in the IHR |
|  |  | ICVP.D5.DE.23 |   Certificate valid until (date) | Date until which the certificate remains valid | Date |  |  |  |
| ICVP.D5 | Generate and sign digital ICVP | ICVP.D5.DE.24 | Text following the table in the Model ICVP in Annex 6 | This certificate is valid only if the vaccine or prophylaxis used has been approved by the World Health Organization. Any amendment of this certificate, or erasure, or failure to complete any part of it, may render it invalid. The validity of this certificate shall extend until the date indicated for the particular vaccination or prophylaxis. The certificate shall be fully completed in English or in French. | String | R |  |  |
| ICVP.D5 | Generate and sign digital ICVP | ICVP.D5.DE.25 | Cryptographic signature of the issuer | A digital cryptographic signature generated by the issuing authority and applied to the certificate data as part of the integrity check. | String | R |  |  |
| ICVP.D5 | Generate and sign digital ICVP | ICVP.D5.DE.26 | Key identifier for signature verification | An identifier that references the public key or trusted source required to verify the issuer's cryptographic signature as part of the integrity check. | String | R |  |  |
| ICVP.D5 | Generate and sign digital ICVP | ICVP.D5.DE.27 | Version | Identifier indicating the version of the certificate | String | R |  |  |

