Logical: PreQualVaccineDetails
Parent: VaccineDetails
Title: "PreQual - Vaccine Details"
Description:  "Vaccine Data elements from the Pre Qual Database"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^status = #active
* ^experimental = true
* productID obeys is-a-prequal-product-id



Invariant: is-a-prequal-product-id
Description: "Product ID comes from the PreQual Databatase"
Expression: "system = 'http://smart.who.int/pcmt-vaxprequal/CodeSystem/PreQualProductIDs'"
Severity: #error