The following functional requirements define the minimum mandatory system capabilities necessary to support the issuance and ascertainment of validity and authenticity of an ICVP in digital format. The required functions may be implemented within existing digital services or through new services, depending on the national digital health architecture.

| Digital Service | Functional Requirement |
|---|---|
| Immunization or Prophylaxis Registry | It SHALL be possible to record vaccination or prophylaxis details as outlined in the data requirements for an ICVP in digital format. |
| Immunization or Prophylaxis Registry | It SHALL be possible to confirm that all required data for generating an ICVP in digital format are complete at the time of entry. |
| Certificate Generation Service | It SHALL be possible to issue an ICVP in digital format based on vaccination or prophylaxis data obtained from an authorized digital source (i.e. the immunization or prophylaxis registry) meeting applicable completeness and conformance requirements. |
| Certificate Generation Service | It SHALL be possible to determine whether all required data for issuance of an ICVP in digital format are complete and valid so that any missing or invalid data can be corrected and ICVP in digital format can be issued. |
| Certificate Generation Service | ICVPs in digital format SHALL be generated based on validated vaccination or prophylaxis data. |
| Certificate Generation Service | ICVPs in digital format SHALL be linked to the correct individual, for example through verified identity attributes so that they cannot be misused or presented by another traveller. |
| Certificate Generation Service | Each ICVP in digital format SHALL be assigned a unique identifier so that it can be tracked, verified, and referenced reliably. |
| Status checking application | It SHALL be possible to scan or read the QR code contained in an ICVP in digital format for the purpose of digital ascertainment of validity and authenticity. |
| Status checking application | It SHALL be possible to clearly indicate whether an ICVP in digital format is valid, revoked, expired or cannot be ascertained. |
| Status checking application | It SHALL be possible to display key data elements, such as travellerâ€™s name, date of birth and vaccination or prophylaxis details, to support confirmation that the ICVP in digital format corresponds to the traveller. |
| Status checking application | It SHALL be possible to determine whether all required data elements are present in the ICVP in digital format so that incomplete ICVPs are identified before validity checks. |
| Status checking application | It SHALL be possible to automatically calculate vaccination or prophylaxis validity using applicable IHR requirements and relevant national implementation rules. |
| Status checking application | It SHALL be possible to indicate whether the authenticity of the ICVP in digital format can be established through digital ascertainment so that non-digital ascertainment procedures can be followed, where required. |
