Alias: $DVCImmunization = http://smart.who.int/icvp/StructureDefinition/DVCImmunization
Alias: $VaccineProduct = http://smart.who.int/icvp/StructureDefinition/VaccineProduct
Alias: $PreQualVaccineType = http://smart.who.int/icvp/ValueSet/PreQualVaccineType
Alias: $PreQualVaccineIDs = http://smart.who.int/icvp/ValueSets/PreQualProductIDs
Alias: $doseNumberCodeableConcept = http://smart.who.int/icvp/StructureDefinition/DoseNumberCodeableConcept


Profile: DVCSDImmunization
Parent: DVCImmunization
Id: DVCSDImmunization
Title: "DVC Immunization with Selective Disclosure"
Description: "DVC Immunization with Selective Disclosure"
* extension contains SelectiveDisclosureJWT  named SelectiveDisclosureJWT 0..1
* text.extension contains SelectiveDisclosureJWT  named SelectiveDisclosureJWT 0..1


Profile: DVCImmunization
Parent: Immunization
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
//* protocolApplied 1.. MS
//* protocolApplied ^slicing.discriminator.type = #type
//* protocolApplied ^slicing.discriminator.path = "authority"
//* protocolApplied ^slicing.rules = #open
//* protocolApplied contains protocolAppliedAuthority 1.. MS
//* protocolApplied[protocolAppliedAuthority].authority only Reference(MCSDJurisdictionOrganization)
//* protocolApplied[protocolAppliedAuthority].targetDisease from DiseaseTargeted (preferred)
//* protocolApplied[protocolAppliedAuthority].targetDisease ^label = "Disease or agent targeted"
//* protocolApplied[protocolAppliedAuthority].doseNumber[x] 1..1 MS
//* protocolApplied[protocolAppliedAuthority].doseNumber[x].extension contains $doseNumberCodeableConcept named DoseNumberCodeableConcept 1..1
* extension contains ProductID named productID 1..1 MS
* extension[productID] obeys has-a-product-id-code
* extension[productID] obeys is-a-prequal-product-id
* vaccineCode obeys has-a-prequal-vaccine-type




Invariant: has-a-prequal-vaccine-product-id-code
Description: "Ensure vaccine type is from the prequal vaccine database"
Severity: #error
Expression: "valueCoding.memberOf('http://smart.who.int/pcmt-vaxprequal/ValueSets/PreQualProductIDs')"


Invariant: has-a-prequal-vaccine-type
Description: "Ensure vaccine type is from the prequal vaccine database"
Severity: #error
Expression: "memberOf('http://smart.who.int/pcmt-vaxprequal/CodeSystem/PreQualVaccineType')"


Extension: DoseNumberCodeableConcept
Description: "Dose Number"
* value[x] only CodeableConcept