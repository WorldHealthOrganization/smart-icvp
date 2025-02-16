
Instance: DVCDocSDExample
InstanceOf: DVCSDBundle
Description: "Example ICVP Document"
Usage: #example 
* language = #en-GB
* identifier.system = "urn:oid:2.16.724.4.8.10.200.10"
* identifier.value = "157bd032-8b00-4728-b2dc-748bb1501aed"
* type = #document
* timestamp = "2024-02-11T11:32:00+01:00"
* entry[composition].fullUrl = "urn:uuid:23451938-53ea-4d4f-b07b-7f557656005e"
* entry[composition].resource = 23451938-53ea-4d4f-b07b-7f557656005e  //composition
* entry[demographic].fullUrl = "urn:uuid:157863f7-fdea-4d11-92ff-f33345a560e4"
* entry[demographic].resource = 157863f7-fdea-4d11-92ff-f33345a560e4 
* entry[vaccination].fullUrl = "urn:uuid:bc283f8f-0279-4cc1-9d4d-8928b0341d00" //immunization
* entry[vaccination].resource = bc283f8f-0279-4cc1-9d4d-8928b0341d00 



Instance: 23451938-53ea-4d4f-b07b-7f557656005e
InstanceOf: DVCSDComposition
Title : "DVC Composition"
Description: "DVC Composition Example with Selective Disclosure"
Usage: #inline
* identifier.system = "urn:oid:2.16.724.4.8.10.200.10"
* identifier.value = "d348b02a-3ab8-4cec-bbec-5186abca8c7d"
* status = #final
* type = $LOINC#82593-5 "Patient summary Document"
* subject = Reference(urn:uuid:2b90dd2b-2dab-4c75-9bb9-a355e07401e8)
* date = "2017-12-11T14:30:00+01:00"
* author = Reference(urn:uuid:1c616b24-3895-48c4-9a02-9a64110351ef)
* title = "Patient Summary as of December 11, 2017 14:30"
* text.div =   "<div xmlns=\"http://www.w3.org/1999/xhtml\">To be added</div>"
* text.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-narrative 
* text.status = #generated
* confidentiality = #N
* section[demographic].title = "Patient"
* section[demographic].text.status = #generated
* section[demographic].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Sample patient</div>"
* section[demographic].text.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic-narrative
* section[demographic].entry = Reference(urn:uuid:157863f7-fdea-4d11-92ff-f33345a560e4)
* section[vaccination].title = "Vaccination"
* section[vaccination].code = $LOINC#11369-6 "History of Vaccination"
* section[vaccination].text.status = #generated
* section[vaccination].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Vaccination stuff</div>"
* section[vaccination].text.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-vaccination-narrative
* section[vaccination].entry[+] = Reference(urn:uuid:bc283f8f-0279-4cc1-9d4d-8928b0341d00)
* extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp



Instance: 157863f7-fdea-4d11-92ff-f33345a560e4
InstanceOf: DVCSDPatient
Description: "Example Patient with Selective Disclosure"
Usage: #inline
* active = true
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Test Patient name and demographics</div>"
* text.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic-narrative
* identifier[+].type = $identifierType#PPN
* identifier[=].system = "https://uidai.gov.in/"
* identifier[=].value = "123456789012"
* identifier.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic-national-id
* name[dvcName].text = "Test Patient"
* name[dvcName].extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic-name
* gender = #female
* gender.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic-sex
* birthDate = "2023-02-04"
* birthDate.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic-dob
* extension[nationality].extension[code].valueCodeableConcept = #IND
* extension[nationality].extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic-nationality
* extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-demographic


Instance: bc283f8f-0279-4cc1-9d4d-8928b0341d00
InstanceOf: DVCSDImmunization
Description: "Example Vaccination with Selective Disclosure"
Usage: #inline
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">vaccination event details</div>"
* text.extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-vaccination-narrative
* status = #completed
* vaccineCode.coding.code = $ICD11#XM0N24
* lotNumber = "67890"
* patient = Reference(urn:uuid:157863f7-fdea-4d11-92ff-f33345a560e4)
* performer[+].actor = Reference(urn:uuid:086a66bd-63d0-442a-900f-b540f6b8cebe)
* performer[=].extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-vaccination-clinician
* occurrenceDateTime = "2024-05-23"
* extension[productID].valueCoding  = $PreQualProductIds#YellowFeverProductd2c75a15ed309658b3968519ddb31690
* extension[$SelectiveDisclosure].valueCode = DisclosureStatements#disclose-icvp-vaccination



