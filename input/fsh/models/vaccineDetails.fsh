Alias: $Product = http://smart.who.int/pcmt/StructureDefinition/Product



Profile: ICVPVaccineDetailsSD
Parent: ICVPVaccineDetails
Id: ICVPVaccineDetailsSD
Title: "ICVP Vaccine Details with Selective Disclosure"
Description: "ICVP Vaccine Details with Selective Disclosure"
* issuer.extension contains $SelectiveDisclosure  named SelectiveDisclosure 0..1
* clinicianName.extension contains $SelectiveDisclosure  named SelectiveDisclosure 0..1
//* extension contains $SelectiveDisclosure  named SelectiveDisclosure 0..1

