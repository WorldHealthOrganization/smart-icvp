

Profile: DVCSDBundle
Parent: DVCBundle
Id: DVCSDBundle
Title: "DVC document Bundle with Selective Disclosure"
Description: "DVC document Bundle with Selective Disclosure for each entry"
* entry[composition].resource only DVCSDComposition
* entry[demographic].resource only DVCSDPatient
* entry[vaccination].resource only DVCSDImmunization


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
    demographic 1..1 and
    vaccination 1..* 
* entry[composition].resource 1..
* entry[composition].resource only DVCComposition
* entry[demographic].resource 1..
* entry[demographic].resource only DVCPatient
* entry[vaccination].resource 1..
* entry[vaccination].resource only DVCImmunization