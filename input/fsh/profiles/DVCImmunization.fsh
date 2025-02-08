Alias: $VaccineProduct = http://smart.who.int/icvp/StructureDefinition/VaccineProduct
Alias: $PreQualVaccineType = http://smart.who.int/icvp/ValueSet/PreQualVaccineType
Alias: $doseNumberCodeableConcept = http://smart.who.int/icvp/StructureDefinition/DoseNumberCodeableConcept

Profile: DVCImmunization
//
// Parent: ImmunizationUvIps
// Id: DVC-ImmunizationUvIps
Id: DVCImmunization
Title: "DVC Immunization"
Description: "This profile represents Immunization record for Digital Vaccine Certificates"

* lotNumber MS
* lotNumber ^label = "Vaccine batch number"
//* patient only Reference(DVCPatient)
* occurrence[x] only dateTime
* occurrence[x] ^label = "Date of vaccination"
* performer 0.. 
* performer.actor only Reference(MCSDPractitioner or MCSDJurisdictionOrganization)
* performer.actor ^label = "Health worker identifier"
* protocolApplied 1.. MS
* protocolApplied ^slicing.discriminator.type = #type
* protocolApplied ^slicing.discriminator.path = "authority"
* protocolApplied ^slicing.rules = #open
* protocolApplied contains protocolAppliedAuthority 1.. MS
* protocolApplied[protocolAppliedAuthority].authority only Reference(MCSDJurisdictionOrganization)
* protocolApplied[protocolAppliedAuthority].targetDisease from DiseaseTargeted (preferred)
* protocolApplied[protocolAppliedAuthority].targetDisease ^label = "Disease or agent targeted"
* protocolApplied[protocolAppliedAuthority].doseNumber[x] 1..1 MS
* protocolApplied[protocolAppliedAuthority].doseNumber[x].extension contains $doseNumberCodeableConcept named DoseNumberCodeableConcept 1..1
* obeys has-a-vaccine-product  
* obeys has-a-pre-qual-vaccine-type


Extension: VaccineProduct
Description:
"""The business identifier of a vaccine product in a product catalogue.

In FHIR R6, this could also be a reference to an InventoryItem
"""
Context: Immunization
//
// note: for FHIR R6 we want something like:
//  value[x] only from Identifier or Reference(InventoryItem)
* value[x] only from Identifier

Invariant: has-a-vaccine-product
Description:
"""Check if there is a business identifier of a vaccine product in a product catalogue.

In FHIR R6, this could also be a reference to an InventoryItem
"""
* extension contains VaccineProduct named vaccineProduct 1..1 MS


Invariant: has-a-pre-qual-vaccine-type
Description: "Ensure vaccine type is from the prequal vaccine database"
* vaccineCode from $PreQualVaccineType (required)




Extension: DoseNumberCodeableConcept
Description: "Dose Number"
* value[x] only CodeableConcept