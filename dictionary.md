# Data Dictionary - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Business Requirements**](business-requirements.md)
* **Data Dictionary**

## Data Dictionary

Component 5 in the Digital Adaptation Kit (DAK) for ICVP (link forthcoming) outlines the minimum set of data corresponding to different points of the workflow within the identified business processes. This data set can be used on any softwaresystem and lists the data elements relevant for service delivery and executing decision-support logic, as well as for populating indicators and performance metrics.

See Web Annex A of the DAK for the complete data dictionary in spreadsheet form detailing the input options, validation checks and concept dictionary codes.

#### Data Dictionary ICVP

| | | | | | | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
|  |  | Name | The full name of the client | N/A | String | Only letters and special characters (period, dash) allowed | R |  |  |  |  |  |
|  |  | Date of birth | Client's date of birth (DOB) if known; if unknown, use assigned DOB for administrative purposes | N/A | Date | Date ≤ current date | R |  |  |  |  |  |
|  |  | Sex | Documentation of a specific instance of sex information for the client | Select one | Coding | None | O |  |  |  |  |  |
|  |  | Male | Client's biological sex is male | Input option | Codes | None |  |  |  |  |  |  |
|  |  | Female | Client's biological sex is female | Input option | Codes | None |  |  |  |  |  |  |
|  |  | Biological sex not specified | Client's biological sex is not specified | Input option | Codes | None |  |  |  |  |  |  |
|  |  | Intersex | Client's biological sex is intersex | Input option | Codes | None |  |  |  |  |  |  |
|  |  | Nationality | Nationality | Select one | Coding | None | O | bound to 3 letter ISO codes |  |  |  |  |
|  |  | National Identification Document | National Identification Document | N/A | String | None | O |  |  |  |  |  |
|  |  | Guardian | Name of Parent or Guardian | N/A | String | None | O |  |  |  |  |  |
|  |  | Issuer | Document Issuer | N/A | String | None | O |  |  |  |  |  |
|  |  | product ID | Vaccine Product ID | N/A | Coding | None | R | Codes as defined in WHO Prequal Database |  |  |  |  |
|  |  | Date | Date of vaccine | N/A | Date | None | R |  |  |  |  |  |
|  |  | Clinician Name | Name of supervising clinician | N/A | String | Either clinician name or issuer must be present | O |  |  |  |  |  |
|  |  | issuer | Relevant Authority responsible for issuing the certificate, or for overseeing the administration center | N/A | String | Either clinician name or issuer must be present | O |  |  |  |  |  |
|  |  | Vaccine batch number | Batch number or lot number of vaccine | N/A | String | None | R |  |  |  |  |  |
|  |  | Certificate valid from | Date in which the certificate for an immunization event became valid. No health or clinical inferences should be made from this date | N/A | DateTime | None | O |  |  |  |  |  |
|  |  | Certificate valid until | Last date in which the certificate for an immunization event is valid. No health or clinical inferences should be made from this date | N/A | DateTime | None | O |  |  |  |  |  |

