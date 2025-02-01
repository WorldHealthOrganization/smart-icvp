Logical:         DVCPayload
Title:           "dICVPmin HCERT Payload"
Description:     "Payload for digital ICVP - dICVPmin CBOR Web Token Logical Model"

* ^url = "http://smart.who.int/icvp/StructureDefinition/DVCPayload"
* ^version = "1"
* ^status = #draft

* n 1..1 string "Person name"
* dob 1..1 date "Date of birth in YYYY-MM-DD format"
* s 0..1 code "Sex"
* ntl 0..1 code "Nationality"
* nid 0..1 string "National Identification Document"
* gn 0..1 string "Parent or Guardian Name"
 // Vaccination group -------------------------------------------------------
* v 1..1 BackboneElement "Vaccination Group (see element details)"
  * dn 1..1 code "Dose Number"
  * vp 1..1 code "Vaccine Trade item id"
  * dt 1..1 date "Date of vaccination, YYYY-MM-DD format"
  * bo 1..1 string "Batch No"
  * vls 0..1 date "Certificate Validity periods start date"
  * vle 0..1 date "Certificate Validity periods end date"
  * cn 0..1 string "Name of supervising clinician"
  * is 0..1 id "Certificate issuer id (referenced organization)"
  * vp from preQualVaccines (required)
* obeys mustHaveIsOrCn

Invariant: mustHaveIsOrCn
Description: "Either issuer or clinicianName must be present"
Expression: "v.is.exists() or v.cn.exists()"
Severity: #error
