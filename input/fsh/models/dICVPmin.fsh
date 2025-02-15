Alias: $identifierType = http://terminology.hl7.org/CodeSystem/v2-0203

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
* ndt 0..1 code "National ID Document Type"
* ndt from $identifierType (extensible)
* gn 0..1 string "Parent or Guardian Name"
 // Vaccination group -------------------------------------------------------
* v 1..1 BackboneElement "Vaccination Group (see element details)"
  * vp 1..1 string "ICVP Product Catalog ID"
  * vp from preQualVaccines (required)
  * dt 1..1 date "Date of vaccination, YYYY-MM-DD format"
  * cn 0..1 string "Name of supervising clinician"
  * is 0..1 id "Certificate issuer id (referenced organization)"
  * bo 1..1 string "Batch No"
  * vls 0..1 date "Certificate Validity periods start date"
  * vle 0..1 date "Certificate Validity periods end date"
* obeys must-have-issuer-or-clinician-name


Invariant: must-have-issuer-or-clinician-name
Description: "Either issuer or clinicianName must be present"
Expression: "v.is.exists() or v.cn.exists()"
Severity: #error
