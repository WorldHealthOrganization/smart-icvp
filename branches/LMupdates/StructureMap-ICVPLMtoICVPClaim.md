# ICVPLMtoICVPClaim - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **ICVPLMtoICVPClaim**

## StructureMap: ICVPLMtoICVPClaim 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/StructureMap/ICVPLMtoICVPClaim | *Version*:0.3.0 |
| Draft as of 2026-04-16 | *Computable Name*:ICVPLMtoICVPClaim |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ICVPLMtoICVPClaim",
  "url" : "http://smart.who.int/icvp/StructureMap/ICVPLMtoICVPClaim",
  "version" : "0.3.0",
  "name" : "ICVPLMtoICVPClaim",
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
    "url" : "http://smart.who.int/icvp/StructureDefinition/ICVP",
    "mode" : "source",
    "alias" : "ICVPLogicalModel"
  },
  {
    "url" : "http://smart.who.int/icvp/StructureDefinition/ICVPVaccineDetails",
    "mode" : "source",
    "alias" : "ICVPVaccineDetails"
  },
  {
    "url" : "http://smart.who.int/icvp/StructureDefinition/ICVPMin",
    "mode" : "target",
    "alias" : "ICVPClaim"
  }],
  "group" : [{
    "name" : "ICVPLMtoICVPClaim",
    "input" : [{
      "name" : "lm",
      "type" : "ICVPLogicalModel",
      "mode" : "source"
    },
    {
      "name" : "claim",
      "type" : "ICVPClaim",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "rule1",
      "source" : [{
        "context" : "lm",
        "element" : "name",
        "variable" : "name"
      }],
      "target" : [{
        "context" : "claim",
        "element" : "n",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "name"
        }]
      }]
    },
    {
      "name" : "rule2",
      "source" : [{
        "context" : "lm",
        "element" : "dob",
        "variable" : "dob"
      }],
      "target" : [{
        "context" : "claim",
        "element" : "dob",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "dob"
        }]
      }]
    },
    {
      "name" : "rule3a",
      "source" : [{
        "context" : "lm",
        "element" : "sex",
        "variable" : "sex"
      }],
      "rule" : [{
        "name" : "rule3",
        "source" : [{
          "context" : "sex",
          "element" : "code",
          "variable" : "code"
        }],
        "target" : [{
          "context" : "claim",
          "element" : "s",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "code"
          }]
        }]
      }]
    },
    {
      "name" : "rule4a",
      "source" : [{
        "context" : "lm",
        "element" : "nationality",
        "variable" : "nationality"
      }],
      "rule" : [{
        "name" : "rule4",
        "source" : [{
          "context" : "nationality",
          "element" : "code",
          "variable" : "code"
        }],
        "target" : [{
          "context" : "claim",
          "element" : "ntl",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "code"
          }]
        }]
      }]
    },
    {
      "name" : "rule5",
      "source" : [{
        "context" : "lm",
        "element" : "nid",
        "variable" : "nid"
      }],
      "target" : [{
        "context" : "claim",
        "element" : "nid",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "nid"
        }]
      }]
    },
    {
      "name" : "rule6",
      "source" : [{
        "context" : "lm",
        "element" : "guardian",
        "variable" : "guardian"
      }],
      "target" : [{
        "context" : "claim",
        "element" : "gn",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "guardian"
        }]
      }]
    },
    {
      "name" : "rule7",
      "source" : [{
        "context" : "lm",
        "element" : "vaccineDetails",
        "variable" : "vaccineDetails"
      }],
      "target" : [{
        "context" : "claim",
        "element" : "v",
        "variable" : "tVax"
      }],
      "dependent" : [{
        "name" : "mapVaccineDetails",
        "parameter" : [{
          "valueId" : "vaccineDetails"
        },
        {
          "valueId" : "tVax"
        }]
      }]
    }]
  },
  {
    "name" : "mapVaccineDetails",
    "input" : [{
      "name" : "v",
      "type" : "ICVPVaccineDetails",
      "mode" : "source"
    },
    {
      "name" : "tVax",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "rule9a",
      "source" : [{
        "context" : "v",
        "element" : "disease",
        "variable" : "coding"
      }],
      "rule" : [{
        "name" : "rule9",
        "source" : [{
          "context" : "coding",
          "element" : "code",
          "variable" : "disease"
        }],
        "target" : [{
          "context" : "tVax",
          "element" : "tg",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "disease"
          }]
        }]
      }]
    },
    {
      "name" : "rule10b",
      "source" : [{
        "context" : "v",
        "element" : "productID",
        "variable" : "vc"
      }],
      "rule" : [{
        "name" : "rule10a",
        "source" : [{
          "context" : "vc",
          "element" : "Coding",
          "variable" : "coding"
        }],
        "rule" : [{
          "name" : "rule10",
          "source" : [{
            "context" : "coding",
            "element" : "code",
            "variable" : "vaccine"
          }],
          "target" : [{
            "context" : "tVax",
            "element" : "vp",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "vaccine"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "rule11a",
      "source" : [{
        "context" : "v",
        "element" : "vaccineTradeItem",
        "variable" : "identifier"
      }],
      "rule" : [{
        "name" : "rule11",
        "source" : [{
          "context" : "identifier",
          "element" : "value",
          "variable" : "id"
        }],
        "target" : [{
          "context" : "tVax",
          "element" : "mp",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "id"
          }]
        }]
      }]
    },
    {
      "name" : "rule12",
      "source" : [{
        "context" : "v",
        "element" : "manufacturer",
        "variable" : "manufacturer"
      }],
      "target" : [{
        "context" : "tVax",
        "element" : "ma",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "manufacturer"
        }]
      }]
    },
    {
      "name" : "rule13a",
      "source" : [{
        "context" : "v",
        "element" : "manufacturerId",
        "variable" : "identifier"
      }],
      "rule" : [{
        "name" : "rule13",
        "source" : [{
          "context" : "identifier",
          "element" : "value",
          "variable" : "mid"
        }],
        "target" : [{
          "context" : "tVax",
          "element" : "mid",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "mid"
          }]
        }]
      }]
    },
    {
      "name" : "rule14",
      "source" : [{
        "context" : "v",
        "element" : "date",
        "variable" : "date"
      }],
      "target" : [{
        "context" : "tVax",
        "element" : "dt",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "date"
        }]
      }]
    },
    {
      "name" : "rule15",
      "source" : [{
        "context" : "v",
        "element" : "batchNo",
        "variable" : "batch"
      }],
      "target" : [{
        "context" : "tVax",
        "element" : "bo",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "batch"
        }]
      }]
    },
    {
      "name" : "rule16a",
      "source" : [{
        "context" : "v",
        "element" : "validityPeriod",
        "variable" : "period"
      }],
      "rule" : [{
        "name" : "rule16",
        "source" : [{
          "context" : "period",
          "element" : "start",
          "variable" : "start"
        }],
        "target" : [{
          "context" : "tVax",
          "element" : "vls",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "start"
          }]
        }]
      },
      {
        "name" : "rule17",
        "source" : [{
          "context" : "period",
          "element" : "end",
          "variable" : "end"
        }],
        "target" : [{
          "context" : "tVax",
          "element" : "vle",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "end"
          }]
        }]
      }]
    },
    {
      "name" : "rule18",
      "source" : [{
        "context" : "v",
        "element" : "clinicianName",
        "variable" : "clinicianName"
      }],
      "target" : [{
        "context" : "tVax",
        "element" : "cn",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "clinicianName"
        }]
      }]
    },
    {
      "name" : "rule19a",
      "source" : [{
        "context" : "v",
        "element" : "issuer",
        "variable" : "reference"
      }],
      "rule" : [{
        "name" : "rule19",
        "source" : [{
          "context" : "reference",
          "element" : "id",
          "variable" : "issuer"
        }],
        "target" : [{
          "context" : "tVax",
          "element" : "is",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "issuer"
          }]
        }]
      }]
    }]
  }]
}

```
