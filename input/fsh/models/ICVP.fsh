Profile: ICVPSD
Parent: ICVP
Id: ICVPSD
Title: "DVC Icvp with Selective Disclosure"
Description: "DVC Icvp with Selective Disclosure"

* name.extension contains SelectiveDisclosureJWT  named SelectiveDisclosureJWT 0..1
* dob.extension contains SelectiveDisclosureJWT  named SelectiveDisclosureJWT 0..1
* sex.extension contains SelectiveDisclosureJWT  named SelectiveDisclosureJWT 0..1
* nationality.extension contains SelectiveDisclosureJWT  named SelectiveDisclosureJWT 0..1
* nid.extension contains SelectiveDisclosureJWT  named SelectiveDisclosureJWT 0..1
* guardian.extension contains SelectiveDisclosureJWT  named SelectiveDisclosureJWT 0..1
* issuer.extension contains SelectiveDisclosureJWT  named SelectiveDisclosureJWT 0..1
* vaccineDetails only ICVPVaccineDetailsSD




Logical: ICVP
Parent: PreQualDVC
Title: "ICVP"
Description:  "Data elements for the Model International Certificate of Vaccination or Prophylaxis."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^status = #active
* ^experimental = true

* vaccineDetails only ICVPVaccineDetails
