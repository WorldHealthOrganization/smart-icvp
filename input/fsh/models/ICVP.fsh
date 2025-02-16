Profile: ICVPSD
Parent: ICVP
Id: ICVPSD
Title: "DVC Icvp with Selective Disclosure"
Description: "DVC Icvp with Selective Disclosure"

* name.extension contains $SelectiveDisclosure  named SelectiveDisclosure 0..1
* dob.extension contains $SelectiveDisclosure  named SelectiveDisclosure 0..1
* sex.extension contains $SelectiveDisclosure  named SelectiveDisclosure 0..1
* nationality.extension contains $SelectiveDisclosure  named SelectiveDisclosure 0..1
* nid.extension contains $SelectiveDisclosure  named SelectiveDisclosure 0..1
* guardian.extension contains $SelectiveDisclosure  named SelectiveDisclosure 0..1
* issuer.extension contains $SelectiveDisclosure  named SelectiveDisclosure 0..1
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
* obeys is-an-icvp-vaccine-record

Invariant: is-an-icvp-vaccine-record
Description: "Checks if vaccine is on the WHO PreQual or EUL listing"
Expression: "vaccineDetails.productID.conformsTo('ICVPVaccineDetails')"
Severity: #error

