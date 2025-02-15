// Alias: $DVCImmunization = http://smart.who.int/icvp/StructureDefinition/DVCImmunization
// Alias: $VaccineProduct = http://smart.who.int/icvp/StructureDefinition/VaccineProduct
// Alias: $PreQualVaccineType = http://smart.who.int/icvp/ValueSet/PreQualVaccineType
// Alias: $PreQualVaccineIDs = http://smart.who.int/icvp/ValueSets/PreQualProductIDs
// Alias: $doseNumberCodeableConcept = http://smart.who.int/icvp/StructureDefinition/DoseNumberCodeableConcept

Profile: Immunization-uv-ips-DVC
Parent: Immunization-uv-ips
Id: Immunization-uv-ips-DVC
Title: "DVC - Profile for Digitial Vaccination Cards for Immunization for IPS.  Note that no Product Catalog has been set"
Description: "This profile represents an IPS Immunization record that can be mapped onto a Digital Vaccine Certificates using the WHO PreQual Database"

* extension contains ProductID named productID 1..1 MS
* extension[productID] obeys has-a-product-id-code



