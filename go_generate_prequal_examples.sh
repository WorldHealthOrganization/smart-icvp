#!/bin/bash
set -e

#  1:Date of Prequalification
#  2:Vaccine Type
#  3:Commercial Name
#  4:Presentation
#  5:No. of doses
#  6:Manufacturer
#  7:Responsible NRA



#generate presentations



echo "Alias: \$presentation = http://smart.who.int/icvp/CodeSystem/PreQualPresentation
CodeSystem: PreQualPresentation
Title : \"WHO PreQualificaiton Vaccine Presentations\"
Description: \"WHO PreQualificaiton Vaccine Presentations\"

" >  input/fsh/codesystems/prequal_presentation.fsh

awk -vFPAT='([^,]*)|("[^"]+")' -vOFS=, '

  NR>1  {
    print gensub(/"/, "", "g" , $4)
  }' input/data/prequalified_vaccines.csv | \
    sort | \
    uniq | \
    awk  '{
    CMD="echo \""$0"\" | sed '\''s/[^[:alpha:]]//g'\''"
    CMD|getline CODE
    close(CMD)
    print "* #"CODE" \""$0"\""

}' >>  input/fsh/codesystems/prequal_presentation.fsh


echo "Alias: \$preQualPresentation = http://smart.who.int/icvp/CodeSystem/PreQualPresentation
ValueSet: PreQualPresentation
Title : \"WHO PreQualificaiton Presentation \"
Description: \"WHO PreQualificaiton Presentation\"


* include codes from system \$preQualPresentation

" >  input/fsh/valuesets/prequal_presentation.fsh

#generate vaccine type
echo "Alias: \$vaccinetype = http://smart.who.int/icvp/CodeSystem/PreQualVaccineType
CodeSystem: PreQualVaccineType
Title : \"WHO PreQualificaiton Vaccine VaccineTypes\"
Description: \"WHO PreQualificaiton Vaccine VaccineTypes\"

" >  input/fsh/codesystems/preQualVaccineTypes.fsh

awk -vFPAT='([^,]*)|("[^"]+")' -vOFS=, '

  NR>1  {
    print gensub(/"/, "", "g" , $4)
  }' input/data/prequalified_vaccines.csv | \
    sort | \
    uniq | \
    awk  '{
    CMD="echo \""$0"\" | sed '\''s/[^[:alnum:]]//g'\''"
    CMD|getline CODE
    close(CMD)
    print "* #"CODE" \""$0"\""

}' >>  input/fsh/codesystems/preQualVaccineTypes.fsh


echo "Alias: \$preQualVaccineType = http://smart.who.int/icvp/CodeSystem/PreQualVaccineType
ValueSet: PreQualVaccineType
Title : \"WHO PreQualificaiton VaccineType \"
Description: \"WHO PreQualificaiton VaccineType\"


* include codes from system \$preQualVaccineType

" >  input/fsh/valuesets/PreQualVacccineTypes.fsh

#generate manufacturers

echo "Alias: \$orgType = http://terminology.hl7.org/CodeSystem/organization-type" >  input/fsh/examples/prequal_database_manufacturers.fsh

awk -vFPAT='([^,]*)|("[^"]+")' -vOFS=, '

  NR>1  {
    print gensub(/"/, "", "g" , $6)
  }' input/data/prequalified_vaccines.csv | \
    sort | \
    uniq | \
    awk  '{

  CMD="md5 -s \""$0"\""
  CMD|getline MD5
  close(CMD)
  print ""
  print "Instance: Manufacturer"MD5
  print "InstanceOf: IHE.mCSD.Organization"
  print "Usage: #example"
  print "* active = true"
  print "* name = \""$0"\""
  print "* type = $orgType#other"

}' >>  input/fsh/examples/prequal_database_manufacturers.fsh


#generate prequal holder 
echo "Alias: \$orgType = http://terminology.hl7.org/CodeSystem/organization-type" >  input/fsh/examples/prequal_database_holders.fsh
awk -vFPAT='([^,]*)|("[^"]+")' -vOFS=, 'NR>1  {
    print gensub(/"/, "", "g" , $7)
}' input/data/prequalified_vaccines.csv | \
    sort | \
    uniq | \
    awk '{


  CMD="md5 -s \""$0"\""
  CMD|getline MD5
  close(CMD)
  print ""
  print "Instance: Holder"MD5
  print "InstanceOf: IHE.mCSD.Organization"
  print "Usage: #example"
  print "* active = true"
  print "* name = \""$0"\""
  print "* type = $orgType#govt"
}' >>  input/fsh/examples/prequal_database_holders.fsh

# generate TradeProducts and TradeProductAuthorizations
awk -vFPAT='([^,]*)|("[^"]+")' -vOFS=, '
NR > 1{


  VAX=gensub(/"/, "", "g" , $2)

  CMD="echo \""VAX"\" | sed '\''s/[^[:alnum:]]//g'\''"
  CMD|getline VAXTYPE
  close(CMD)
  SHORTVAXTYPE=substr(VAXTYPE,1,24)

  PRESENTATION=gensub(/"/, "", "g" , $4)
  CMD="echo \""PRESENTATION"\" | sed '\''s/[^[:alnum:]]//g'\''"
  CMD|getline PRESENTATIONCODE
  close(CMD)


  # change dd/mm/yyyy 2/3/2015 to yyyy/mm/dd 2015/3/2
  VDATE = gensub(/^([0-9]{1,2})\/([0-9]{1,2})\/([0-9]{4})/,"\\3-\\2-\\1","g",$1)

  STRIPPED=gensub(/"/, "", "g" , $1$2$3$4$5$6$7)
  CMD="md5 -s \""STRIPPED"\""
  CMD|getline MD5
  close(CMD)

  MANUFACTURER=gensub(/"/, "", "g" , $6)
  CMD="md5 -s \""MANUFACTURER"\""
  CMD|getline MD5MANUFACTURER
  close(CMD)

  HOLDER=gensub(/"/, "", "g" , $7)
  CMD="md5 -s \""HOLDER"\""
  CMD|getline MD5HOLDER
  close(CMD)

  COUNTRY=gensub(/"/, "", "g" , $7)
  COMMERCIALNAME=gensub(/"/, "", "g" , $3)



  print ""
  print "// Source Record Row //: " NR
  print "//  Date of Prequalification: ("$1")"
  print "//  Vaccine Type: ("VAX")"
  print "//  Commercial Name: ("COMMERCIALNAME")"
  print "//  Presentation: ("PRESENTATION")"
  print "//  No. of doses: ("$5")"
  print "//  Manufacturer: ("MANUFACTURER")"
  print "//  Responsible NRA: ("HOLDER")"
  print "//  md5(ROW): " MD5
  print "//"
  print ""
  print "Instance: PreQualDB"MD5
  print "InstanceOf: PreQualDBwithIDs"
  print "* dateOfPrequal = "VDATE
  print "* vaccineType = #"SHORTVAXTYPE 
  print "* commercialName = \""COMMERCIALNAME"\""
  print "* presentation.coding.code = #"PRESENTATIONCODE
  if ( $5 ) {
    print "* numDoses = "$5
  }   
  print "* manufacturer.text = \""MANUFACTURER"\""
  print "* responsibleNRA.text = \""HOLDER"\""
  print "* index.value = \""MD5"\""
  print "* manufacturerReference = Reference(Manufacturer"MD5MANUFACTURER") "
  print "* responsibleNRAReference = Reference(Holder"MD5HOLDER") // "HOLDER
  print ""    
  print "Instance: "SHORTVAXTYPE"Product"MD5
  print "InstanceOf: Product"
  print "Usage: #example"
  print "* status = #active"
  print "* name"
  print "  * nameType = #official"
  print "  * value = \""   COMMERCIALNAME  "\""
  print "* manufacturer = Reference(Manufacturer"MD5MANUFACTURER") // "MANUFACTURER
  if ( $5 ) {
    print "* doseQuantity =  " $5  " '\''doses'\''"
  }   
  print "* classification = #"SHORTVAXTYPE 
  print "* unitOfUse.coding.code = #doses"
  print "* dosageForm.coding.code = #"PRESENTATIONCODE
  print ""
  print "Instance: "SHORTVAXTYPE"PreQual" MD5
  print "InstanceOf: ProductAuthorization"
  print "Usage: #example"
  print "* status = #active"
  print "* type = #prequal"
  print "* jurisdiction.coding.display = \"WHO\""
  print "* holder = Reference(Holder"MD5HOLDER") // "HOLDER
  print "* validityPeriod.start = "VDATE
  print "* product  = Reference("SHORTVAXTYPE"Product"MD5") " 

}' input/data/prequalified_vaccines.csv >  input/fsh/examples/prequal_database_products.fsh

echo really done generating prequal db examples

