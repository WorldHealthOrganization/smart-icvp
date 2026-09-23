# ICVPClaimtoICVPLM - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **ICVPClaimtoICVPLM**

## StructureMap: ICVPClaimtoICVPLM 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/StructureMap/ICVPClaimtoICVPLM | *Version*:0.3.0 |
| Draft as of 2026-04-16 | *Computable Name*:ICVPClaimtoICVPLM |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ICVPClaimtoICVPLM",
  "url" : "http://smart.who.int/icvp/StructureMap/ICVPClaimtoICVPLM",
  "version" : "0.3.0",
  "name" : "ICVPClaimtoICVPLM",
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
    "url" : "http://smart.who.int/icvp/StructureDefinition/ICVP",
    "mode" : "target",
    "alias" : "ICVPModel"
  },
  {
    "url" : "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails",
    "mode" : "target",
    "alias" : "ICVPVaccineDetails"
  }],
  "group" : [{
    "name" : "ICVPClaimtoICVPLM",
    "input" : [{
      "name" : "src",
      "type" : "ICVPPayload",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "ICVPModel",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "rule1",
      "source" : [{
        "context" : "src",
        "element" : "n",
        "variable" : "name"
      }],
      "target" : [{
        "context" : "tgt",
        "element" : "name",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "name"
        }]
      }]
    },
    {
      "name" : "rule2",
      "source" : [{
        "context" : "src",
        "element" : "dob",
        "variable" : "dob"
      }],
      "target" : [{
        "context" : "tgt",
        "element" : "dob",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "dob"
        }]
      }]
    },
    {
      "name" : "rule3",
      "source" : [{
        "context" : "src",
        "element" : "s",
        "variable" : "sex"
      }],
      "target" : [{
        "context" : "tgt",
        "element" : "sex",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "sex"
        }]
      }]
    },
    {
      "name" : "rule3a",
      "source" : [{
        "context" : "src",
        "element" : "ndt",
        "variable" : "ndt"
      }],
      "target" : [{
        "context" : "tgt",
        "element" : "ndt",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "ndt"
        }]
      }]
    },
    {
      "name" : "rule4",
      "source" : [{
        "context" : "src",
        "element" : "ntl",
        "variable" : "nationality"
      }],
      "target" : [{
        "context" : "tgt",
        "element" : "nationality",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "nationality"
        }]
      }]
    },
    {
      "name" : "rule5",
      "source" : [{
        "context" : "src",
        "element" : "nid",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "tgt",
        "element" : "nid",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "id"
        }]
      }]
    },
    {
      "name" : "rule6",
      "source" : [{
        "context" : "src",
        "element" : "gn",
        "variable" : "gName"
      }],
      "target" : [{
        "context" : "tgt",
        "element" : "guardian",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "gName"
        }]
      }]
    },
    {
      "name" : "rule7",
      "source" : [{
        "context" : "src",
        "element" : "v",
        "variable" : "v"
      }],
      "target" : [{
        "context" : "tgt",
        "element" : "vaccineDetails",
        "variable" : "tv"
      }],
      "dependent" : [{
        "name" : "mapVaccineDetails",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueId" : "tv"
        }]
      }]
    }]
  },
  {
    "name" : "mapVaccineDetails",
    "input" : [{
      "name" : "src",
      "type" : "BackboneElement",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "ICVPVaccineDetails",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "rule9",
      "source" : [{
        "context" : "src",
        "element" : "vp",
        "variable" : "vp"
      }],
      "target" : [{
        "variable" : "coding",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Coding"
        }]
      },
      {
        "context" : "coding",
        "element" : "code",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "vp"
        }]
      },
      {
        "context" : "coding",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://smart.who.int/pcmt-vaxprequal/CodeSystem/PreQualProductIds"
        }]
      },
      {
        "context" : "tgt",
        "element" : "productID",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "coding"
        }]
      }]
    },
    {
      "name" : "rule13",
      "source" : [{
        "context" : "src",
        "element" : "dt",
        "variable" : "dt"
      }],
      "target" : [{
        "context" : "tgt",
        "element" : "date",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "dt"
        }]
      }]
    },
    {
      "name" : "rule14",
      "source" : [{
        "context" : "src",
        "element" : "bo",
        "variable" : "bo"
      }],
      "target" : [{
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      },
      {
        "context" : "code",
        "element" : "text",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "bo"
        }]
      },
      {
        "context" : "tgt",
        "element" : "batchNo",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "code"
        }]
      }]
    },
    {
      "name" : "rule18",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "variable" : "period",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Period"
        }]
      }],
      "rule" : [{
        "name" : "rule15",
        "source" : [{
          "context" : "src",
          "element" : "vls",
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
      },
      {
        "name" : "rule16",
        "source" : [{
          "context" : "src",
          "element" : "vle",
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
      },
      {
        "name" : "rule17",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "tgt",
          "element" : "validityPeriod",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "period"
          }]
        }]
      }]
    },
    {
      "name" : "rule19",
      "source" : [{
        "context" : "src",
        "element" : "cn",
        "variable" : "cn"
      }],
      "target" : [{
        "context" : "tgt",
        "element" : "clinicianName",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "cn"
        }]
      }]
    },
    {
      "name" : "rule21",
      "source" : [{
        "context" : "src",
        "element" : "is",
        "variable" : "is"
      }],
      "target" : [{
        "context" : "tgt",
        "element" : "issuer",
        "variable" : "issuer"
      },
      {
        "context" : "issuer",
        "element" : "reference",
        "transform" : "append",
        "parameter" : [{
          "valueString" : "Organization/"
        },
        {
          "valueId" : "is"
        }]
      }]
    }]
  },
  {
    "name" : "generateNarrativeText",
    "documentation" : "helper function",
    "input" : [{
      "name" : "src",
      "type" : "Section",
      "mode" : "source"
    },
    {
      "name" : "text",
      "type" : "string",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "setstatus",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "text",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "empty"
        }]
      }]
    },
    {
      "name" : "setdiv",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "text",
        "element" : "div",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "<div>narrative not available</div>"
        }]
      }]
    }]
  },
  {
    "name" : "humanNameToHumanName",
    "input" : [{
      "name" : "sourceName",
      "mode" : "source"
    },
    {
      "name" : "targetName",
      "type" : "HumanName",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "CopyUse",
      "source" : [{
        "context" : "sourceName",
        "element" : "use",
        "variable" : "use"
      }],
      "target" : [{
        "context" : "targetName",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "use"
        }]
      }]
    },
    {
      "name" : "CopyText",
      "source" : [{
        "context" : "sourceName",
        "element" : "text",
        "variable" : "text"
      }],
      "target" : [{
        "context" : "targetName",
        "element" : "text",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "text"
        }]
      }]
    },
    {
      "name" : "CopyFamily",
      "source" : [{
        "context" : "sourceName",
        "element" : "family",
        "variable" : "family"
      }],
      "target" : [{
        "context" : "targetName",
        "element" : "family",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "family"
        }]
      }]
    },
    {
      "name" : "CopyGiven",
      "source" : [{
        "context" : "sourceName",
        "element" : "given",
        "variable" : "given"
      }],
      "target" : [{
        "context" : "targetName",
        "element" : "given",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "given"
        }]
      }]
    },
    {
      "name" : "CopyPrefix",
      "source" : [{
        "context" : "sourceName",
        "element" : "prefix",
        "variable" : "prefix"
      }],
      "target" : [{
        "context" : "targetName",
        "element" : "prefix",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "prefix"
        }]
      }]
    },
    {
      "name" : "CopySuffix",
      "source" : [{
        "context" : "sourceName",
        "element" : "suffix",
        "variable" : "suffix"
      }],
      "target" : [{
        "context" : "targetName",
        "element" : "suffix",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "suffix"
        }]
      }]
    },
    {
      "name" : "copyPeriod",
      "source" : [{
        "context" : "sourceName",
        "element" : "period",
        "variable" : "sourcePeriod"
      }],
      "target" : [{
        "context" : "targetName",
        "element" : "period",
        "variable" : "targetPeriod"
      }],
      "rule" : [{
        "name" : "CopyPeriod",
        "source" : [{
          "context" : "sourcePeriod"
        }],
        "target" : [{
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "sourcePeriod"
          }]
        }],
        "dependent" : [{
          "name" : "periodToPeriod",
          "parameter" : [{
            "valueId" : "sourcePeriod"
          },
          {
            "valueId" : "targetPeriod"
          }]
        }]
      }],
      "documentation" : "Copy the period using the previously defined group function"
    }]
  },
  {
    "name" : "periodToPeriod",
    "input" : [{
      "name" : "sourcePeriod",
      "mode" : "source"
    },
    {
      "name" : "targetPeriod",
      "type" : "Period",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "setPeriodStart",
      "source" : [{
        "context" : "sourcePeriod",
        "element" : "start",
        "variable" : "start"
      }],
      "target" : [{
        "context" : "targetPeriod",
        "element" : "start",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "start"
        }]
      }]
    },
    {
      "name" : "setPeriodEnd",
      "source" : [{
        "context" : "sourcePeriod",
        "element" : "end",
        "variable" : "end"
      }],
      "target" : [{
        "context" : "targetPeriod",
        "element" : "end",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "end"
        }]
      }]
    }]
  }]
}

```
