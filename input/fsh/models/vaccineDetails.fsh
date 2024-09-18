Logical: ModelVaccineDetails
Title: "DVC - Vaccine Details"
Description:  "Vaccine Data elements for the Digital Vaccination Certificates"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^status = #active
* ^experimental = true

* doseNumber 1..1 CodeableConcept "Dose Number" "Dose Number"
* doseNumber from doseNumber (required)
* disease 1..1 Coding "Disease" "Name of disease or condition vaccinated or received prophylaxis against"
* disease from DiseaseTargeted (required)
* vaccineClassification 1..1 CodeableConcept "Vaccine code" "Vaccine or prophylaxis classification code"
* vaccineClassification from DVCVaccines (required)
* vaccineTradeItem 0..1 Identifier "vaccine trade item id" "Vaccine trade item id"
* date 1..1 date "Date" "Date of vaccine"
* clinicianName 0..1 string "Name of supervising clinician" "Name of supervising clinician, or relevant authority responsible for issuing this certificate, or for overseeing the administering centre"
* issuer 0..1 Reference(Organization) "Issuing Organization" "Relevant authoring reponsible for issuing the certificate, or for overseeing the administration center"
* manufacturerId 0..1 Identifier "Manufacture ID" "Manufacturer ID"
* manufacturer 1..1 string "Name of Manufacturer of vaccine" "Name Manufacturer of vaccine"
* batchNo 1..1 string "Batch No" "Batch No"
* validityPeriod 0..1 Period "Certificate validity period" "Certificate validity period"

