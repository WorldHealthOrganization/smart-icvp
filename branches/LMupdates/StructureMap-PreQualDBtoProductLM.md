# PreQualDBtoProductLM - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **PreQualDBtoProductLM**

## StructureMap: PreQualDBtoProductLM 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/StructureMap/PreQualDBtoProductLM | *Version*:0.3.0 |
| Draft as of 2026-04-16 | *Computable Name*:PreQualDBtoProductLM |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "PreQualDBtoProductLM",
  "url" : "http://smart.who.int/icvp/StructureMap/PreQualDBtoProductLM",
  "version" : "0.3.0",
  "name" : "PreQualDBtoProductLM",
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
    "url" : "http://smart.who.int/icvp/StructureDefinition/PreQualDBwithIDs",
    "mode" : "source",
    "alias" : "PreQualDB"
  },
  {
    "url" : "http://smart.who.int/icvp/StructureDefinition/Product",
    "mode" : "target",
    "alias" : "Product"
  }],
  "group" : [{
    "name" : "PreQualDBtoProductLM",
    "input" : [{
      "name" : "prequal",
      "type" : "PreQualDB",
      "mode" : "source"
    },
    {
      "name" : "product",
      "type" : "Product",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "setNumber",
      "source" : [{
        "context" : "prequal",
        "element" : "number",
        "variable" : "number"
      }],
      "target" : [{
        "context" : "product",
        "element" : "number",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "number"
        }]
      }]
    },
    {
      "name" : "setName",
      "source" : [{
        "context" : "prequal",
        "element" : "commercialName",
        "variable" : "name"
      }],
      "target" : [{
        "context" : "product",
        "element" : "name",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "name"
        }]
      }]
    },
    {
      "name" : "setManufacturer",
      "source" : [{
        "context" : "prequal",
        "element" : "manufacturer",
        "variable" : "manufacturer"
      }],
      "target" : [{
        "context" : "product",
        "element" : "manufacturer",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "manufacturer"
        }]
      }]
    },
    {
      "name" : "setDate",
      "source" : [{
        "context" : "prequal",
        "element" : "dateOfPrequal",
        "variable" : "date"
      }],
      "target" : [{
        "context" : "product",
        "element" : "dateOfPrequal",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "date"
        }]
      }]
    },
    {
      "name" : "setVaccineType",
      "source" : [{
        "context" : "prequal",
        "element" : "vaccineType",
        "variable" : "vaccineType"
      }],
      "target" : [{
        "context" : "product",
        "element" : "vaccineType",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "vaccineType"
        }]
      }]
    },
    {
      "name" : "setPresentation",
      "source" : [{
        "context" : "prequal",
        "element" : "presentation",
        "variable" : "presentation"
      }],
      "target" : [{
        "context" : "product",
        "element" : "presentation",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "presentation"
        }]
      }]
    },
    {
      "name" : "setDoses",
      "source" : [{
        "context" : "prequal",
        "element" : "numDoses",
        "variable" : "doses"
      }],
      "target" : [{
        "context" : "product",
        "element" : "numDoses",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "doses"
        }]
      }]
    },
    {
      "name" : "setResponsibleNRA",
      "source" : [{
        "context" : "prequal",
        "element" : "responsibleNRA",
        "variable" : "nra"
      }],
      "target" : [{
        "context" : "product",
        "element" : "responsibleNRA",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "nra"
        }]
      }]
    }]
  }]
}

```
