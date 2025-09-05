
Logical:         ICVPMin
Parent:          $DVCMin
Title:           "ICVP HCERT Payload"
Description:     "Mininmial DVC payload for use within an HCERT Payload using the ICVP Product Catalogue"
* ^status = #active
//* ^url = "http://smart.who.int/icvp/StructureDefinition/DVCPayload"
* ^version = "1"
* ^abstract = false
* v only ICVPMinVaccineDetails



Logical:         ICVPMinVaccineDetails
Parent:          $DVCMinVaccineDetails
Title:           "ICVP HCERT Payload"
Description:     "Mininmial vaccine detail in DVC payload for use within an HCERT Payload using the ICVP Product Catalogue"
* ^status = #active
* ^version = "1"
* ^abstract = false
* vp from ICVPProductIds (required)

