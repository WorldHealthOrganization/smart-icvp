




Logical: ICVP
Parent: $PreQualDVC
Title: "ICVP"
Description:  "Data elements for the Model International Certificate of Vaccination or Prophylaxis."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^status = #active
* ^experimental = true
* vaccineDetails only ICVPVaccineDetails
/* * obeys is-an-icvp-vaccine-record

Invariant: is-an-icvp-vaccine-record
Description: "Checks if vaccine is on the WHO PreQual or EUL listing"
Expression: "vaccineDetails.productID.conformsTo('ICVPVaccineDetails')"
Severity: #error */

