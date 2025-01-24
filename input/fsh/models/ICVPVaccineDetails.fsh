Logical: ModelVaccineDetails
Title: "ICVP - Vaccine Details"
Description:  "Vaccine Data elements for the International Certificate of Vaccination or Prophylaxis"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^status = #active
* ^experimental = true

* disease 1..1 Coding "Disease" "Name of disease or condition vaccinated or received prophylaxis against"
* disease from ICVPDiseaseTargeted (required)
* vaccineClassification 1..1 CodeableConcept "Vaccine code" "Vaccine or prophylaxis classification code"
* vaccineClassification from ICVPVaccineCodes (required)
* date 1..1 date "Date" "Date of vaccine"
* clinicianName 0..1 string "Name of supervising clinician" "Name of supervising clinician, or relevant authority responsible for issuing this certificate, or for overseeing the administering centre"
* issuer 0..1 Reference(Organization) "Issuing Organization" "Relevant authoring responsible for issuing the certificate, or for overseeing the administration center"
* manufacturer 1..1 string "Name of Manufacturer of vaccine" "Name Manufacturer of vaccine"
* batchNo 0..1 string "Batch No" "Batch No"
* validityPeriod 0..1 Period "Certificate validity period" "Certificate validity period"


