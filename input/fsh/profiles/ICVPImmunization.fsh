
Profile: ICVPImmunization
Parent: $DVCImmunization
Id: ICVPImmunization
Title: "ICVP Immunization"
Description: "This profile represents Immunization record for Digital Vaccine Certificates for use in the International Certificate of Vaccination or Prophylaxis (ICVP).  Such vaccine should be listed in the ICVP Product Catalogue

The ICVP product catalogue consists of vaccines listed in the list of Prequalified Vaccines and the Emergency Use Listing.
 - https://extranet.who.int/prequal/vaccines/prequalified-vaccines
 - https://www.who.int/teams/regulation-prequalification/eul

In FHIR R6, this could also be a reference to an InventoryItem
"
* vaccineCode obeys has-an-icvp-vaccine-type



Invariant: has-an-icvp-vaccine-product-id-code
Description:
"""Check if there is a business identifier of a vaccine product in the ICVP product catalogue,  The ICVP product catalogue consists of vaccines listed in the list of Prequalified Vaccines and the Emergency Use Listing.
 - https://extranet.who.int/prequal/vaccines/prequalified-vaccines
 - https://www.who.int/teams/regulation-prequalification/eul

In FHIR R6, this could also be a reference to an InventoryItem
"""
Severity: #error
Expression: "memberOf('http://smart.who.int/icvp/ValueSets/ICVPProductIDs')"


Invariant: has-an-icvp-vaccine-type
Description: "Ensure vaccine type is from the prequal vaccine database for ICVP vaccines"
Severity: #error
Expression: "memberOf('http://smart.who.int/pcmt-vaxprequal/CodeSystem/ICVPVaccineType')"
