Logical: ModelDVC
Title: "DVC"
Description:  "Data elements for Digital Vaccination Certificate."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^status = #active
* ^experimental = true

* name 1..1 string "Name" "The full name of the client"
* dob 1..1 date "Date of Birth" "Date of Birth"
* sex 0..1 code "Sex" "Sex"
* nationality 0..1 code "Nationality" "Nationality"
* nid 0..1 string "National Identification Document" "National Identification Document"
* guardian 0..1 string "Parent/Guardian" "Name of Parent or Guardian"
* issuer 0..1 Reference(Organization) "Document issuer" "Document issuer"
* vaccineDetails 1..* ModelVaccineDetails "Vaccine Details" "Vaccine Details"
* obeys mustHaveIssuerOrClinician

Invariant: mustHaveIssuerOrClinician
Description: "Either issuer or clinicianName must be present"
Expression: "vaccineDetails.issuer.exists() or vaccineDetails.clinicianName.exists()"
Severity: #error
