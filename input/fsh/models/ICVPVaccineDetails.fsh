Logical: ICVPVaccineDetails
Parent: PreQualVaccineDetails
Title: "ICVP - Vaccine Details"
Description:  "Vaccine Data elements for the Model International Certificate of Vaccination or Prophylaxis."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^status = #active
* ^experimental = true



* disease from ICVPDiseaseTargeted (required)
* vaccineClassification from ICVPVaccineCodes (required)