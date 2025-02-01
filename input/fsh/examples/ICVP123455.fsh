/* Instance: IVCP123455
InstanceOf: ModelICVP
Description: "Example ICVP"
Usage: #example 

* name = "Test Patient"
* dob = "2023-02-04"
* sex =  #female
* nationality = #IND
* vaccineDetails[0].vaccineClassification.text = "Yellow Fever Vaccines"
* vaccineDetails[=].vaccineClassification.coding.code = #XM0N24
* vaccineDetails[=].date = "2024-05-23"
* vaccineDetails[=].clinicianName = "DR A"
* vaccineDetails[=].manufacturer = "PFIZER"
* vaccineDetails[=].batchNo = "67890"
* vaccineDetails[=].validityPeriod.start = "2024-05-31"
* vaccineDetails[=].doseNumber.text = "second"
* vaccineDetails[=].doseNumber.coding.code = #FirstDose
* vaccineDetails[=].doseNumber.coding.display = "First Dose"
* vaccineDetails[=].doseNumber.coding.system = "http://smart.who.int/icvp/CodeSystem/doseNumber"
* vaccineDetails[=].disease.display = "Yellow Fever"
* vaccineDetails[=].disease.code = #1D47
* vaccineDetails[=].disease.system = "http://id.who.int/icd/release/11/mms"
 */