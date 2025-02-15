// Alias: $DVCImmunization = http://smart.who.int/icvp/StructureDefinition/DVCImmunization
// Alias: $VaccineProduct = http://smart.who.int/icvp/StructureDefinition/VaccineProduct
// Alias: $PreQualVaccineType = http://smart.who.int/icvp/ValueSet/PreQualVaccineType
// Alias: $PreQualVaccineIDs = http://smart.who.int/icvp/ValueSets/PreQualProductIDs
// Alias: $doseNumberCodeableConcept = http://smart.who.int/icvp/StructureDefinition/DoseNumberCodeableConcept

Profile: Immunization-uv-ips-PreQual
Parent: Immunization-uv-ips-DVC
Id: Immunization-uv-ips-PreQual
Title: "DVC - WHO PreQual Immunization for IPS"
Description: "This profile represents an IPS Immunization record that can be mapped onto a Digital Vaccine Certificates using the WHO PreQual Database"

* extension[productID] obeys has-a-prequal-vaccine-product-id-code
* vaccineCode obeys has-a-prequal-vaccine-type


