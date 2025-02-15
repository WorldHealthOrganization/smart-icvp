
Extension: ProductID
Description:
"""The business identifier of a  product in a product catalogue.

In FHIR R6, this could also be a reference to an InventoryItem
"""
Context: Immunization
//
// note: for FHIR R6 we want something like:
//  value[x] only from code or Reference(InventoryItem)
* value[x] only Coding or Reference(MedicationCatalogItem)


Invariant: has-a-product-id-code
Description: "Ensure there is a product id code. A more robust expression is needed here.  Intended to be called on (a collection) of ProductId extensions. //to do: better expresssion: valueCoding or valueReference exists and meets the requisite profiles, etc."
Severity: #error
Expression: "exists()"

