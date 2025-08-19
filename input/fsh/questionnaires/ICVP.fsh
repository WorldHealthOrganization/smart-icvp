
Instance: ICVP
InstanceOf: sdc-questionnaire-extr-smap
Description: "Questionnaire for DVC Logical Model with the WHO ICVP"
Title: "ICVP Model Questionnaire"
Usage: #definition
* status = #draft
* contained[+] = http://terminology.hl7.org/ValueSet/v3-Country
* contained[+] = http://terminology.hl7.org/ValueSet/v2-0001
* contained[+] = http://smart.who.int/icvp/ValueSet/ICVPProductIds
* contained[+] = http://smart.who.int/trust-phw/ValueSet/DVCRelationshipStatus


* insert Question(name, Full Name of the client, string, false, true)
* insert Question(dob, Date of Birth, date, false, true)
* insert Question(sex, Sex, choice, false, false)
* item[=].answerValueSet = "http://terminology.hl7.org/ValueSet/v2-0001"
* insert Question(nationality, Nationality, choice, false, false)
* item[=].answerValueSet = "http://terminology.hl7.org/ValueSet/v3-Country" 
* insert Question(nid, National Identification Document, string, false, false)
* insert Question(guardian, Parent or Guardian Details, group, false, false)
* item[=]
  * insert Question(guardianName, Name of Parent or Guardian, string, false, false)
  * insert Question(guardianRelationship, Relationship Status, choice, false, false)
  * item[=].answerValueSet = Canonical($DVCRelationshipStatus)
* insert Question(vaccineDetails,Vaccine Certificate Details,group, true, true)
* item[=]
  * insert Question(productID, Vaccine or Prophylaxis ID, choice, false, true)
  * item[=].answerValueSet = Canonical($ICVPProductIds)
  * insert Question(date, Date of Vaccination, date, false, true)
  * insert Question(clinicianName, Name of supervising clinician, string, false, false)
  * insert Question(issuer, Relevant authoring responsible for issuing the certificate\, or for overseeing the administration center, string, false, false)
  * insert Question(batchNo.text , Batch Number, string, false, true )
  * insert Question(validityPeriod, Certificate Validity Period, group, false, false)
  * item[=]
    * insert Question(startDate, From, date, false, false)
    * insert Question(endDate, To, date, false, false)
