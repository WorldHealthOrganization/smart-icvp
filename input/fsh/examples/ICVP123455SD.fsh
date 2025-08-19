Instance: IVCP123455SD
InstanceOf: ICVPSD
Description: "Example ICVP with Selective Disclosure"
Usage: #example 

* name = "Test Patient (SD)"
* name.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic-name

* dob = "2023-02-04"
* dob.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic-dob

* sex =  #female
* sex.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic-sex

* nationality = #IND
* nationality.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic-nationality

* nid.value = "987-65-4321-000"
* nid.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic-national-id


* vaccineDetails[+].productID =  $PreQualProductIDs#PolioVaccineOralOPVBivalProduct756b50d1047d7e92674342044a986a4e
* vaccineDetails[=].date = "2024-05-23"
* vaccineDetails[=].clinicianName = "DR A"
* vaccineDetails[=].clinicianName.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-vaccination-clinician
* vaccineDetails[=].batchNo.coding.display = "67890"
* vaccineDetails[=].validityPeriod.start = "2024-05-31"

