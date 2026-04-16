# ICVPQRtoICVPLM - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **ICVPQRtoICVPLM**

## StructureMap: ICVPQRtoICVPLM 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/StructureMap/ICVPQRtoICVPLM | *Version*:0.3.0 |
| Draft as of 2026-04-16 | *Computable Name*:ICVPQRtoICVPLM |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ICVPQRtoICVPLM",
  "url" : "http://smart.who.int/icvp/StructureMap/ICVPQRtoICVPLM",
  "version" : "0.3.0",
  "name" : "ICVPQRtoICVPLM",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse",
    "mode" : "source",
    "alias" : "QuestionnaireResponse"
  },
  {
    "url" : "http://smart.who.int/icvp/StructureDefinition/ICVP",
    "mode" : "target",
    "alias" : "ICVPLogicalModel"
  },
  {
    "url" : "http://smart.who.int/icvp/StructureDefinition/ICVPVaccineDetails",
    "mode" : "target",
    "alias" : "ICVPVaccineDetails"
  },
  {
    "url" : "http://smart.who.int/icvp/StructureDefinition/ICVPMin",
    "mode" : "target",
    "alias" : "ICVPClaim"
  }],
  "group" : [{
    "name" : "ICVPQRtoICVPLM",
    "input" : [{
      "name" : "qr",
      "type" : "QuestionnaireResponse",
      "mode" : "source"
    },
    {
      "name" : "lm",
      "type" : "ICVPLogicalModel",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "rule1b",
      "source" : [{
        "context" : "qr",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('name')"
      }],
      "rule" : [{
        "name" : "rule1a",
        "source" : [{
          "context" : "item",
          "element" : "answer",
          "variable" : "answer"
        }],
        "rule" : [{
          "name" : "rule1",
          "source" : [{
            "context" : "answer",
            "element" : "value",
            "variable" : "name"
          }],
          "target" : [{
            "context" : "lm",
            "element" : "name",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "name"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "rule2b",
      "source" : [{
        "context" : "qr",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('dob')"
      }],
      "rule" : [{
        "name" : "rule2a",
        "source" : [{
          "context" : "item",
          "element" : "answer",
          "variable" : "answer"
        }],
        "rule" : [{
          "name" : "rule2",
          "source" : [{
            "context" : "answer",
            "element" : "value",
            "variable" : "dob"
          }],
          "target" : [{
            "context" : "lm",
            "element" : "dob",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "dob"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "rule3b",
      "source" : [{
        "context" : "qr",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('sex')"
      }],
      "rule" : [{
        "name" : "rule3a",
        "source" : [{
          "context" : "item",
          "element" : "answer",
          "variable" : "answer"
        }],
        "rule" : [{
          "name" : "rule3",
          "source" : [{
            "context" : "answer",
            "element" : "value",
            "variable" : "sex"
          }],
          "target" : [{
            "context" : "lm",
            "element" : "sex",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "sex"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "rule4b",
      "source" : [{
        "context" : "qr",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('nationality')"
      }],
      "rule" : [{
        "name" : "rule4a",
        "source" : [{
          "context" : "item",
          "element" : "answer",
          "variable" : "answer"
        }],
        "rule" : [{
          "name" : "rule4",
          "source" : [{
            "context" : "answer",
            "element" : "value",
            "variable" : "nationality"
          }],
          "target" : [{
            "context" : "lm",
            "element" : "nationality",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "nationality"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "rule5b",
      "source" : [{
        "context" : "qr",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('nid')"
      }],
      "rule" : [{
        "name" : "rule5a",
        "source" : [{
          "context" : "item",
          "element" : "answer",
          "variable" : "answer"
        }],
        "rule" : [{
          "name" : "rule5",
          "source" : [{
            "context" : "answer",
            "element" : "value",
            "variable" : "nid"
          }],
          "target" : [{
            "context" : "lm",
            "element" : "nid",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "nid"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "rule6b",
      "source" : [{
        "context" : "qr",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('guardian')"
      }],
      "rule" : [{
        "name" : "rule6a",
        "source" : [{
          "context" : "item",
          "element" : "answer",
          "variable" : "answer"
        }],
        "rule" : [{
          "name" : "rule6",
          "source" : [{
            "context" : "answer",
            "element" : "value",
            "variable" : "guardian"
          }],
          "target" : [{
            "context" : "lm",
            "element" : "guardian",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "guardian"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "rule7",
      "source" : [{
        "context" : "qr",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('vaccineDetails')"
      }],
      "target" : [{
        "context" : "lm",
        "element" : "vaccineDetails",
        "variable" : "v"
      }],
      "dependent" : [{
        "name" : "mapVaccineDetails",
        "parameter" : [{
          "valueId" : "item"
        },
        {
          "valueId" : "v"
        }]
      }]
    }]
  },
  {
    "name" : "mapVaccineDetails",
    "input" : [{
      "name" : "s",
      "type" : "BackboneElement",
      "mode" : "source"
    },
    {
      "name" : "v",
      "type" : "ICVPVaccineDetails",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "rule7b",
      "source" : [{
        "context" : "s",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('productID')"
      }],
      "rule" : [{
        "name" : "rule7a",
        "source" : [{
          "context" : "item",
          "element" : "answer",
          "variable" : "answer"
        }],
        "rule" : [{
          "name" : "rule7",
          "source" : [{
            "context" : "answer",
            "element" : "value",
            "variable" : "productID"
          }],
          "target" : [{
            "context" : "v",
            "element" : "productID",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "productID"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "rule8b",
      "source" : [{
        "context" : "s",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('date')"
      }],
      "rule" : [{
        "name" : "rule8a",
        "source" : [{
          "context" : "item",
          "element" : "answer",
          "variable" : "answer"
        }],
        "rule" : [{
          "name" : "rule8",
          "source" : [{
            "context" : "answer",
            "element" : "value",
            "variable" : "date"
          }],
          "target" : [{
            "context" : "v",
            "element" : "date",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "date"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "rule9b",
      "source" : [{
        "context" : "s",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('clinicianName')"
      }],
      "rule" : [{
        "name" : "rule9a",
        "source" : [{
          "context" : "item",
          "element" : "answer",
          "variable" : "answer"
        }],
        "rule" : [{
          "name" : "rule9",
          "source" : [{
            "context" : "answer",
            "element" : "value",
            "variable" : "clinicianName"
          }],
          "target" : [{
            "context" : "v",
            "element" : "clinicianName",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "clinicianName"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "rule10b",
      "source" : [{
        "context" : "s",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('issuer')"
      }],
      "rule" : [{
        "name" : "rule10a",
        "source" : [{
          "context" : "item",
          "element" : "answer",
          "variable" : "answer"
        }],
        "rule" : [{
          "name" : "rule10",
          "source" : [{
            "context" : "answer",
            "element" : "value",
            "variable" : "issuer"
          }],
          "target" : [{
            "context" : "v",
            "element" : "issuer",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "issuer"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "rule11b",
      "source" : [{
        "context" : "s",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('batchNo.text')"
      }],
      "rule" : [{
        "name" : "rule11a",
        "source" : [{
          "context" : "item",
          "element" : "answer",
          "variable" : "answer"
        }],
        "rule" : [{
          "name" : "rule11",
          "source" : [{
            "context" : "answer",
            "element" : "value",
            "variable" : "batchNo"
          }],
          "target" : [{
            "context" : "v",
            "element" : "batchNo",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "batchNo"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "rule15",
      "source" : [{
        "context" : "s",
        "element" : "item",
        "variable" : "item",
        "condition" : "linkId.value in ('validityPeriod')"
      }],
      "rule" : [{
        "name" : "rule14",
        "source" : [{
          "context" : "item"
        }],
        "target" : [{
          "context" : "v",
          "element" : "validityPeriod",
          "variable" : "period"
        }],
        "rule" : [{
          "name" : "rule12b",
          "source" : [{
            "context" : "item",
            "element" : "item",
            "variable" : "item",
            "condition" : "linkId.value in ('startDate')"
          }],
          "rule" : [{
            "name" : "rule12a",
            "source" : [{
              "context" : "item",
              "element" : "answer",
              "variable" : "answer"
            }],
            "rule" : [{
              "name" : "rule12",
              "source" : [{
                "context" : "answer",
                "element" : "validityPeriod",
                "variable" : "start"
              }],
              "target" : [{
                "context" : "period",
                "element" : "start",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "start"
                }]
              }]
            }]
          }]
        },
        {
          "name" : "rule13b",
          "source" : [{
            "context" : "item",
            "element" : "item",
            "variable" : "item",
            "condition" : "linkId.value in ('endDate')"
          }],
          "rule" : [{
            "name" : "rule13a",
            "source" : [{
              "context" : "item",
              "element" : "answer",
              "variable" : "answer"
            }],
            "rule" : [{
              "name" : "rule13",
              "source" : [{
                "context" : "answer",
                "element" : "validityPeriod",
                "variable" : "end"
              }],
              "target" : [{
                "context" : "period",
                "element" : "end",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "end"
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  }]
}

```
