Instance: IVCP123455
InstanceOf: ModelICVP
Description: "Example ICVP"
Usage: #example 

* name = "Test Patient"
* dob = "2023-02-04"
* sex =  #female
* nationality = #IND
* vaccineDetails[0].disease.display = "Yellow fever"
* vaccineDetails[=].vaccineClassification.text = "YF"
* vaccineDetails[=].date = "2024-01-23"
* vaccineDetails[=].clinicianName = "DR A"
* vaccineDetails[=].manufacturer = "PFIZER"
* vaccineDetails[=].batchNo = "12345"
* vaccineDetails[=].validityPeriod.start = "2024-01-31"
* vaccineDetails[=].doseNumber.text = "first"
* vaccineDetails[+].disease.display = "Yellow fever"
* vaccineDetails[=].vaccineClassification.text = "YF"
* vaccineDetails[=].date = "2024-05-23"
* vaccineDetails[=].clinicianName = "DR A"
* vaccineDetails[=].manufacturer = "PFIZER"
* vaccineDetails[=].batchNo = "67890"
* vaccineDetails[=].validityPeriod.start = "2024-05-31"
* vaccineDetails[=].doseNumber.text = "second"


