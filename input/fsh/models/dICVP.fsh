Logical: dICVPVaccineDetails
Parent: VaccineDetails
Title: "dICVP - Vaccine Details"
Description:  "Vaccine Data elements for the Digital Model International Certificate of Vaccination or Prophylaxis."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^status = #active
* ^experimental = true


* certificateId 1..1 id "Certificate ID" "Certificate ID"
* vaccineTradeItem 0..1 code "vaccine trade item id" "Vaccine trade item id"
* manufacturerId 0..1 Identifier "Manufacture ID" "Manufacturer ID"
* serialNo 0..1 string "Serial No" "Serial No"
* vaccineTradeItem from preQualVaccines (required)

Logical: dICVP
Parent: DVC
Title: "dICVP"
Description:  "Data elements for digital International Certificate of Vaccination or Prophylaxis."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^status = #active
* ^experimental = true

* vaccineDetails only dICVPVaccineDetails

Invariant: mustHaveBatchNoOrSerialNo
Description: "Either issuer or clinicianName must be present"
Expression: "vaccineDetails.batchNo.exists() or vaccineDetails.serialNo.exists()"
Severity: #error
