Instance: DVCExample
InstanceOf: DVC

Description: "Example DVC model"
Usage: #example 

* name = "Test Patient"
* dob = "2023-02-04"
* sex =  #female
* nationality = #IND

//* vaccineDetails[0].disease.display = "Measles"
//* vaccineDetails[=].disease.code = #1F03
//* vaccineDetails[=].disease.system = "http://id.who.int/icd/release/11/mms"
//* vaccineDetails[=].vaccineClassification.coding.display = "Measles vaccines"
//* vaccineDetails[=].vaccineClassification.coding.code = #XM28X5
//* vaccineDetails[=].vaccineClassification.coding.system = "http://id.who.int/icd/release/11/mms"

* vaccineDetails[+].productID = $PreQualProductIDs#PolioVaccineOralOPVBivalProduct756b50d1047d7e92674342044a986a4e
* vaccineDetails[=].date = "2024-01-23"
* vaccineDetails[=].clinicianName = "DR. A"
* vaccineDetails[=].batchNo.coding.display = "12345"
* vaccineDetails[=].validityPeriod.start = "2024-01-31"

