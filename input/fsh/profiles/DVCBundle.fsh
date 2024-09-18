Profile: DVCBundle
Parent: Bundle
Title : "Digital Vaccination Certificate - Bundle"
Description : "Digital Vaccination Certificate - Bundle"

* ^publisher = "WHO"
* . ^short = "Digital ICVP Certificate Bundle"
* . ^definition = "Digital ICVP Certificate Bundle."
* identifier 1.. MS
* type = #document (exactly)
* timestamp 1.. MS
* entry MS
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.discriminator[+].type = #profile
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.rules = #open
* entry contains
    composition 1..1 and
    patient 1..1 and
    immunization 0..* 
* entry[composition].resource 1..
* entry[composition].resource only DVCComposition
* entry[patient].resource 1..
* entry[patient].resource only DVCPatient
* entry[immunization].resource 1..
* entry[immunization].resource only DVCImmunization