
Logical:         ICVPMin
Parent:          $DVCMin
Title:           "ICVP HCERT Payload"
Description:     "Mininmial DVC payload for use within an HCERT Payload using the ICVP Product Catalogue"
* ^url = "http://smart.who.int/icvp/StructureDefinition/DVCPayload"
* ^version = "1"
* ^status = #draft
* ^abstract = false
* v only ICVPMinVaccineDetails



Logical:         ICVPMinVaccineDetails
Parent:          $DVCMinVaccineDetails
Title:           "ICVP HCERT Payload"
Description:     "Mininmial vaccine detail in DVC payload for use within an HCERT Payload using the ICVP Product Catalogue"
* ^version = "1"
* ^status = #draft
* ^abstract = false
* vp from ICVPProductIds (required)


Invariant: must-have-issuer-or-clinician-name
Description: "Either issuer or clinicianName must be present"
Expression: "v.is.exists() or v.cn.exists()"
Severity: #error
