Profile: DVCSDComposition
Parent: DVCComposition
Title : "Digital Vaccination Certificate - Composition"
Description : "Digital Vaccination Certificate - Composition"
* extension contains $SelectiveDisclosure  named SelectiveDisclosure 0..1
* text.extension contains $SelectiveDisclosure  named SelectiveDisclosure 0..1
* section[vaccination].entry only Reference(DVCSDImmunization)
* section[demographic].entry only Reference(DVCSDPatient)

Profile: DVCComposition
Parent: Composition
Title : "Digital Vaccination Certificate - Composition"
Description : "Digital Vaccination Certificate - Composition"

* text MS
* identifier MS
* status MS
* type only CodeableConceptIPS
* type = $LOINC#82593-5
* type MS
* type ^short = "Kind of composition (\"DVC\")"
* type ^definition = "Specifies that this composition refers to a Digital Vaccination Certificate (Loinc \"82593-5\")\r\n"
* subject 1.. MS
* subject only Reference(DVCPatient)
* subject ^definition = "The subject of the ICVP"
* subject.reference 1.. MS
* date MS
* event 0..1 
* event.period 0..1
* event.period.start ^label = "Certificate valid from"
* event.period.end ^label = "Certificate valid until"

* section ^slicing.discriminator[+].type = #value
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.discriminator[+].type = #type
* section ^slicing.discriminator[=].path = "focus"
* section ^slicing.rules = #closed


* section contains
    demographic 1..1 MS and
    vaccination 1..* MS

* section[demographic] ^short = "Demographic Status Section"
* section[demographic] ^definition = "Demographic Status Section lists the relvant demographics known abot the subject of the ICVP"
* section[demographic].code = $LOINC#11369-6
* section[demographic].entry only Reference(DVCPatient)


* section[vaccination] ^short = "Vaccination Status Section"
* section[vaccination] ^definition = "Vaccination Status Section lists the relvant vaccinations received by the subject of the ICVP"
* section[vaccination].code = $LOINC#11369-6
//* section[vaccination].focus 1..1 MS
//* section[vaccination].focus only Reference($DVCImmunization)
* section[vaccination].entry only Reference(DVCImmunization)