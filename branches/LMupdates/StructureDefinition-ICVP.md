# ICVP - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **ICVP**

## Logical Model: ICVP ( Experimental ) 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/StructureDefinition/ICVP | *Version*:0.3.0 |
| Active as of 2026-04-16 | *Computable Name*:ICVP |

 
Data elements for the Model International Certificate of Vaccination or Prophylaxis. 

**Usages:**

* Derived from this Logical Model: [ICVP (single)](StructureDefinition-ICVPEvent.md) and [pICVP](StructureDefinition-pICVP.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/smart.who.int.icvp|current/StructureDefinition/ICVP)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ICVP.csv), [Excel](StructureDefinition-ICVP.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ICVP",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/tools/StructureDefinition/logical-target",
    "valueBoolean" : true
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver"
    }
  }],
  "url" : "http://smart.who.int/icvp/StructureDefinition/ICVP",
  "version" : "0.3.0",
  "name" : "ICVP",
  "title" : "ICVP",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-04-16T13:19:32+00:00",
  "publisher" : "WHO",
  "contact" : [{
    "name" : "WHO",
    "telecom" : [{
      "system" : "url",
      "value" : "http://who.int"
    }]
  }],
  "description" : "Data elements for the Model International Certificate of Vaccination or Prophylaxis.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://smart.who.int/icvp/StructureDefinition/ICVP",
  "baseDefinition" : "http://smart.who.int/trust-phw/StructureDefinition/DVCPreQual",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ICVP",
      "path" : "ICVP",
      "short" : "ICVP",
      "definition" : "Data elements for the Model International Certificate of Vaccination or Prophylaxis."
    },
    {
      "id" : "ICVP.nationality",
      "path" : "ICVP.nationality",
      "max" : "1"
    },
    {
      "id" : "ICVP.nid",
      "path" : "ICVP.nid",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "ICVP.vaccineDetails",
      "path" : "ICVP.vaccineDetails",
      "type" : [{
        "code" : "http://smart.who.int/icvp/StructureDefinition/ICVPVaccineDetails"
      }]
    }]
  }
}

```
