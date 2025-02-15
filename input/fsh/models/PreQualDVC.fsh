Logical: PreQualDVC
Parent: DVC
Title: "PreQual"
Description:  "Data elements for the Digital Vaccine Certificate using WHO Vaccine PreQualification database" 
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^status = #active
* ^experimental = true

* vaccineDetails only PreQualVaccineDetails
