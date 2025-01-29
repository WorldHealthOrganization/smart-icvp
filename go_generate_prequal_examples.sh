#!/bin/bash
set -e


#  1:Date of Prequalification
#  2:Vaccine Type
#  3:Commercial Name
#  4:Presentation
#  5:No. of doses
#  6:Manufacturer
#  7:Responsible NRA

#awk -F',' '{
awk -vFPAT='([^,]*)|("[^"]+")' -vOFS=, '{


  VAXTYPES["Yellow Fever"] = "YellowFever"
  VAXTYPES["Polio Vaccine - Oral (OPV) Monovalent Type 1"] = "PolioOralMonovalentT1"
  VAXTYPES["Polio Vaccine - Oral (OPV) Monovalent Type 2"] = "PolioOralMonovalentT2"
  VAXTYPES["Polio Vaccine - Oral (OPV) Monovalent Type 3"] = "PolioOralMonovalentT3"
  VAXTYPES["Polio Vaccine - Inactivated (IPV)"] = "PolioInactived"
  VAXTYPES["Polio Vaccine - Oral (OPV) Bivalent Types 1 and 3"] = "PolioOralBivalentT1T3"
  VAXTYPES["Polio Vaccine - Inactivated Sabin (sIPV)"] = "PolioInactivatedSabin"
  VAXTYPES["Polio Vaccine - Novel Oral (nOPV) Type 2"] = "PolioNovelOralT2"
  VAXTYPES["Polio Vaccine - Oral (OPV) Trivalent"] = "PolioOralTrivalent"
  VAXTYPES["Diphtheria-Tetanus-Pertussis (whole cell)-Hepatitis B-Haemophilus influenzae type b-Polio (Inactivated)"] = "DTPHepHaemPolio"
  VAXTYPES["Diphtheria-Tetanus-Pertussis (acellular)-Hepatitis B-Haemophilus influenzae type b-Polio (Inactivated)"] = "DTPacellularHepHaemPolio"


  VAX=gensub(/"/, "", "g" , $2);

  if (! (VAX in VAXTYPES))  {
    print "// Skipping Row " NR " (" VAX ")"
    next
  }
  VAXTYPE = VAXTYPES[VAX]

  # change dd/mm/yyyy 2/3/2015 to yyyy/mm/dd 2015/3/2
  VDATE = gensub(/^([0-9]{1,2})\/([0-9]{1,2})\/([0-9]{4})/,"\\3-\\2-\\1","g",$1)

  CMD="echo -n " $1$2$3$4$5$6$7 " | md5sum | sed \"s/\\s*-*//g\" "
  CMD|getline MD5
  close(CMD)


  print ""
  print "// Source Record Row //: " NR
  print "//  Date of Prequalification: " $1
  print "//  Vaccine Type: " $2
  print "//  Commercial Name: " $3
  print "//  Presentation: " $4
  print "//  No. of doses: " $5
  print "//  Manufacturer: " $6
  print "//  Responsible NRA: " $7
  print "//  md5(): " MD5
  print "//"
  print "Instance: "VAXTYPE"Product"MD5
  print "InstanceOf: TradeProductModel"
  print "Usage: #example"
  print "* status = #active"
  print "* tradeProductName"
  print "  * nameType = #official"
  print "  * name = \""   VAX  "\""
  print "* manufacturerName = \""gensub(/"/, "", "g" , $6)"\""
  print "* doseQuantity =  " $5  " '\''doses'\''"
  print "* associatedGenericProduct"
  print "  * genericProduct = Reference(" VAXTYPE ")"
  print "  * quantity = 1  '\''doses'\''"
  print "* countryOfOrigin.coding.display = \""gensub(/"/, "", "g" , $7)"\""
  print "* unitOfUse.coding.code = #doses"
  print ""
  print "Instance: "VAXTYPE"PreQual" MD5
  print "InstanceOf: RegulatedTradeProductModel"
  print "Usage: #example"
  print "* status = #active"
  print "* jurisdiction.coding.display = \""gensub('/\"/',"","g",$7)"\""
  print "* holder"
  print "  * name = \"WHO\""
  print "  * identifier "
  print "    * value = \"WHO\""
  print "* validityPeriod.start = "VDATE
  print "* associatedTradeProduct  = Reference("VAXTYPE"Product"MD5")"

}' input/data/prequalified_vaccines.csv >  input/fsh/examples/prequal_database_products.fsh

echo really done generating prequal db examples

