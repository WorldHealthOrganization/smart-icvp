Instance: Questionnaire-ICVPModel
InstanceOf: sdc-questionnaire-extr-smap
Description: "Questionnaire for ICVP Logical Model"
Title: "ICVP Model Questionnaire"
Usage: #definition
* status = #draft
* contained[+] = http://terminology.hl7.org/ValueSet/v2-0001
* contained[+] = http://terminology.hl7.org/ValueSet/v3-Country
* contained[+] = ICVPDiseaseTargeted
* contained[+] = ICVPVaccineCodes
* contained[+] = doseNumber
* contained[+] = DVCRelationshipStatus


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
  * item[=].answerValueSet = Canonical(DVCRelationshipStatus)
* insert Question(vaccinDetails,Vaccine Certificate Details,group, true, true)
* item[=]
  * insert Question(doseNumber, Dose Number, choice, false, true)
  * item[=].answerValueSet = Canonical(doseNumber)
  * insert Question(disease, Name of disease of condition vaccinated or received prophylaxis against, choice, false, true)
  * item[=].answerValueSet = Canonical(ICVPDiseaseTargeted)
  * insert Question(vaccineClassification, Vaccine or Prophylaxis classification code, choice, false, true)
  * item[=].answerValueSet = Canonical(ICVPVaccineCodes)
  * insert Question(vaccineTradeItem, Vaccine Trade Item, string, false, false)
  * insert Question(date, Date of Vaccination, date, false, true)
  * insert Question(clinicianName, Name of supervising clinician, string, false, false)
  * insert Question(issuer, Relevant authoring reponsible for issuing the certificate\, or for overseeing the administration center, string, false, false)
  * insert Question(manufacturerId, Manufacturer ID, string, false, false)
  * insert Question(manufacturer, Name of Manufacturer of Vaccine, string, false, true)
  * insert Question(batchNo, Batch Number, string, false, true )
  * insert Question(validityPeriod, Certificate Validity Period, group, false, false)
  * item[=]
    * insert Question(startDate, From, date, false, false)
    * insert Question(endDate, To, date, false, false)