Profile: DVCImmunization
Parent: ImmunizationUvIps
Id: DVC-ImmunizationUvIps
Title: "DVC Immunization"
Description: "This profile represents Immunization record for Digital Vaccine Certificates"

* vaccineCode from DVCVaccines (required)
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
* protocolApplied[protocolAppliedAuthority].doseNumber[x].extension contains $doseNumberCodeableConcept named doseNumberCodeableConcept 1..1



Alias: $doseNumberCodeableConcept = http://smart.who.int/icvp/StructureDefinition/doseNumberCodeableConcept
Extension: doseNumberCodeableConcept
Description: "doseNumber"
* value[x] only CodeableConcept