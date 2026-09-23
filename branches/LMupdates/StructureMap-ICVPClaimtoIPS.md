# ICVPClaimtoIPS - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **ICVPClaimtoIPS**

## StructureMap: ICVPClaimtoIPS 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/StructureMap/ICVPClaimtoIPS | *Version*:0.3.0 |
| Draft as of 2026-04-16 | *Computable Name*:ICVPClaimtoIPS |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ICVPClaimtoIPS",
  "url" : "http://smart.who.int/icvp/StructureMap/ICVPClaimtoIPS",
  "version" : "0.3.0",
  "name" : "ICVPClaimtoIPS",
  "status" : "draft",
  "date" : "2026-04-16T13:19:32+00:00",
  "publisher" : "WHO",
  "contact" : [{
    "name" : "WHO",
    "telecom" : [{
      "system" : "url",
      "value" : "http://who.int"
    }]
  }],
  "structure" : [{
    "url" : "http://smart.who.int/icvp/StructureDefinition/ICVPMin",
    "mode" : "source",
    "alias" : "ICVPPayload"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "target",
    "alias" : "IPS"
  },
  {
    "url" : "http://smart.who.int/icvp/StructureDefinition/ICVP",
    "mode" : "target",
    "alias" : "ICVPModel"
  },
  {
    "url" : "http://smart.who.int/icvp/StructureDefinition/ICVPVaccineDetails",
    "mode" : "target",
    "alias" : "ICVPVaccineDetails"
  }],
  "import" : ["http://smart.who.int/icvp/StructureMap/ICVPLMToIPS",
  "http://smart.who.int/icvp/StructureMap/ICVPClaimtoICVPLM"],
  "group" : [{
    "name" : "ICVPClaimtoIPS",
    "input" : [{
      "name" : "ICVPClaim",
      "type" : "ICVPPayload",
      "mode" : "source"
    },
    {
      "name" : "IPS",
      "type" : "Bundle",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "rule3",
      "source" : [{
        "context" : "ICVPClaim"
      }],
      "target" : [{
        "variable" : "model",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "http://smart.who.int/icvp/StructureDefinition/ICVP"
        }]
      }],
      "rule" : [{
        "name" : "rule1",
        "source" : [{
          "context" : "ICVPClaim"
        }],
        "target" : [{
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "model"
          }]
        }],
        "dependent" : [{
          "name" : "ICVPClaimtoICVPLM",
          "parameter" : [{
            "valueId" : "ICVPClaim"
          },
          {
            "valueId" : "model"
          }]
        }]
      },
      {
        "name" : "rule2",
        "source" : [{
          "context" : "ICVPClaim"
        }],
        "target" : [{
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "IPS"
          }]
        }],
        "dependent" : [{
          "name" : "ICVPLMToIPS",
          "parameter" : [{
            "valueId" : "model"
          },
          {
            "valueId" : "IPS"
          }]
        }]
      }]
    }]
  }]
}

```
