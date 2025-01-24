Alias: $nationality = http://hl7.org/fhir/StructureDefinition/patient-nationality

Profile: DVCPatient
Parent: Patient
Id: DVCPatient
Title: "DVC Patient"
Description: "DVC Patient"

* identifier 0.. MS
* identifier.system MS
* identifier.value MS
* name 1..* MS
* name ^slicing.discriminator[+].type = #value
* name ^slicing.discriminator[=].path = "use"
* name ^slicing.discriminator[+].type = #exists
* name ^slicing.discriminator[=].path = "text"
* name ^slicing.rules = #open
* name contains dvcName 1..* MS
* name[dvcName] ^label = "Name"
* name[dvcName].text 1.. MS
* name[dvcName].use  1..1 MS
* name[dvcName].use = #official
* gender 0..1 
* gender ^label = "Sex"
* birthDate 1..1 MS
* birthDate ^label = "Date of birth"
* contact 0..1 MS
* contact.relationship from DVCRelationshipStatus 
* extension contains
    $nationality named nationality 0..1 MS