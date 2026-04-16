# ICVP Vaccine Details with Selective Disclosure - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **ICVP Vaccine Details with Selective Disclosure**

## Logical Model: ICVP Vaccine Details with Selective Disclosure 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/StructureDefinition/ICVPVaccineDetailsSD | *Version*:0.3.0 |
| Active as of 2026-04-16 | *Computable Name*:ICVPVaccineDetailsSD |

 
ICVP Vaccine Details with Selective Disclosure 

**Usages:**

* This Logical Model Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/smart.who.int.icvp|current/StructureDefinition/ICVPVaccineDetailsSD)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ICVPVaccineDetailsSD.csv), [Excel](StructureDefinition-ICVPVaccineDetailsSD.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ICVPVaccineDetailsSD",
  "extension" : [{
    "url" : "http://hl7.org/fhir/tools/StructureDefinition/logical-target",
    "valueBoolean" : true
  }],
  "url" : "http://smart.who.int/icvp/StructureDefinition/ICVPVaccineDetailsSD",
  "version" : "0.3.0",
  "name" : "ICVPVaccineDetailsSD",
  "title" : "ICVP Vaccine Details with Selective Disclosure",
  "status" : "active",
  "date" : "2026-04-16T13:19:32+00:00",
  "publisher" : "WHO",
  "contact" : [{
    "name" : "WHO",
    "telecom" : [{
      "system" : "url",
      "value" : "http://who.int"
    }]
  }],
  "description" : "ICVP Vaccine Details with Selective Disclosure",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://smart.who.int/icvp/StructureDefinition/ICVPVaccineDetails",
  "baseDefinition" : "http://smart.who.int/icvp/StructureDefinition/ICVPVaccineDetails",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "ICVPVaccineDetails",
      "path" : "ICVPVaccineDetails"
    },
    {
      "id" : "ICVPVaccineDetails.issuer.extension:SelectiveDisclosure",
      "path" : "ICVPVaccineDetails.issuer.extension",
      "sliceName" : "SelectiveDisclosure",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://smart.who.int/trust-phw/StructureDefinition/SelectiveDisclosure"]
      }]
    },
    {
      "id" : "ICVPVaccineDetails.clinicianName.extension",
      "path" : "ICVPVaccineDetails.clinicianName.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "ICVPVaccineDetails.clinicianName.extension:SelectiveDisclosure",
      "path" : "ICVPVaccineDetails.clinicianName.extension",
      "sliceName" : "SelectiveDisclosure",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://smart.who.int/trust-phw/StructureDefinition/SelectiveDisclosure"]
      }]
    }]
  }
}

```
