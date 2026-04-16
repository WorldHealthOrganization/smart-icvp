# Decision-support logic - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Business Requirements**](business-requirements.md)
* **Decision-support logic**

## Decision-support logic

This page describes the decision-support logic included in the WHO Specifications and Standards for Digital ICVP.

The decision-support logic component provides the validation logic in accordance to the IHR, which deconstructs the validation requirements into a format that clearly labels the inputs and outputs that would be operationalized into a Status Checking Application.

### Decision-support logic overview

The structure of the decision-support tables is based on an adaptation of the Decision Model and Notation (DMN), an industry standard for modelling and executing decision logic.

**Table 9. Overview of decision-support tables for digital ICVP**

| | | | |
| :--- | :--- | :--- | :--- |
| ICVP.DT.1 | Ascertain validity of digital ICVP for yellow fever vaccination | ICVP.E7 | Check vaccination validity |
| ICVP.DT.2 | Ascertain validity of digital ICVP for poliovirus vaccination | ICVP.E7 | Check vaccination validity |

### Decision-support tables

#### ICVP.DT.1 Ascertain validity of digital ICVP for yellow fever vaccination

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| **Decision-support table ID** | ICVP.DT.1 |   |   |   |
| **Decision name** | Ascertain validity of digital ICVP for yellow fever vaccination |   |   |   |
| **Activity ID** | ICVP.E7 |   |   |   |
| **Activity name** | Check vaccination validity |   |   |   |
| **Hit Policy Indicator** | Unique (U): a "Unique" hit policy indicator applies. No overlap is possible and all "rules" are mutually exclusive. Only a single rule can be applied and only the outputs of one rule would be relevant. |   |   |   |

| | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
|  |  |  | Recommended care plan | Guidance displayed to the border health inspector |  |  |
| 1 | Vaccine or prophylaxis is**not**included in WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure or the Prequalified lists - Finished pharmaceutical products | - | State Party may wish to take actions including: assessing the status of traveller vis-a-vis vaccine(s) and/or prophylaxis(es) received; administering the vaccine(s) and/or prophylaxis(es) to the traveller, if needed; and issuing an ICVP | Digital ICVP is not valid as vaccine or prophylaxis product is not approved by WHO. | IHR Annex 6: Vaccines or other prophylaxis specified in Annex 7 or recommended under these Regulations shall be of suitable quality; those vaccines and prophylaxis designated by WHO shall be subject to its approval. Certificates under this Annex are valid only if the vaccine or prophylaxis used has been approved by WHO. | IHR (2005) as amended; WHO list of prequalified vaccines; WHO Emergency Use Listing (EUL); WHO prequalified pharmaceutical products |
| 2 | Vaccine or prophylaxis**is**included in WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure or the Prequalified lists - Finished pharmaceutical products | Days since vaccine administered is**less than 10 days** | - | Digital ICVP is not valid as vaccination occurred less than 10 days ago. | IHR Annex 7: Yellow fever vaccines approved by WHO provide protection against infection starting 10 days following the administration of the vaccine. The validity of a certificate of vaccination against yellow fever shall extend for the life of the person vaccinated, beginning 10 days after the date of vaccination. | IHR (2005) as amended; WHO list of prequalified vaccines; WHO Emergency Use Listing (EUL); WHO prequalified pharmaceutical products |
| 3 | Vaccine or prophylaxis**is**included in WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure or the Prequalified lists - Finished pharmaceutical products | Days since vaccine administered is**more than or equal to 10 days** | - | Digital ICVP is valid | IHR Annex 7: Yellow fever vaccines approved by WHO provide protection against infection starting 10 days following the administration of the vaccine. The validity of a certificate of vaccination against yellow fever shall extend for the life of the person vaccinated, beginning 10 days after the date of vaccination. | IHR (2005) as amended; WHO list of prequalified vaccines; WHO Emergency Use Listing (EUL); WHO prequalified pharmaceutical products |

#### ICVP.DT.2 Ascertain validity of digital ICVP for poliovirus vaccination

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| **Decision-support table ID** | ICVP.DT.2 |   |   |   |
| **Decision name** | Ascertain validity of digital ICVP for poliovirus vaccination |   |   |   |
| **Activity ID** | ICVP.E7 |   |   |   |
| **Activity name** | Check vaccination validity |   |   |   |
| **Hit Policy Indicator** | Unique (U): a "Unique" hit policy indicator applies. No overlap is possible and all "rules" are mutually exclusive. Only a single rule can be applied and only the outputs of one rule would be relevant. |   |   |   |

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
|  |  | Recommended care plan | Guidance displayed to the border health inspector |  |  |
| 1 | Vaccine or prophylaxis is**not**included in WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure or the Prequalified lists - Finished pharmaceutical products. | State Party may wish to take actions including: assessing the status of traveller vis-a-vis vaccine(s) and/or prophylaxis(es) received; administering the vaccine(s) and/or prophylaxis(es) to the traveller, if needed; and issuing an ICVP | Digital ICVP is not valid as vaccine or prophylaxis product is not approved by WHO. | IHR Annex 6: Vaccines or other prophylaxis specified in Annex 7 or recommended under these Regulations shall be of suitable quality; those vaccines and prophylaxis designated by WHO shall be subject to its approval. Certificates under this Annex are valid only if the vaccine or prophylaxis used has been approved by WHO. | IHR (2005) as amended; WHO list of prequalified vaccines; WHO Emergency Use Listing (EUL); WHO prequalified pharmaceutical products |
| 2 | Vaccine or prophylaxis**is**included in WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure or the Prequalified lists - Finished pharmaceutical products. | - | Digital ICVP is valid | IHR Annex 6: Vaccines or other prophylaxis specified in Annex 7 or recommended under these Regulations shall be of suitable quality; those vaccines and prophylaxis designated by WHO shall be subject to its approval. Certificates under this Annex are valid only if the vaccine or prophylaxis used has been approved by WHO. | IHR (2005) as amended; WHO list of prequalified vaccines; WHO Emergency Use Listing (EUL); WHO prequalified pharmaceutical products |

