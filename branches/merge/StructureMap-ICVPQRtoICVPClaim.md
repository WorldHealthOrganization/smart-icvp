# ICVPQRtoICVPClaim - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **ICVPQRtoICVPClaim**

## StructureMap: ICVPQRtoICVPClaim 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/StructureMap/ICVPQRtoICVPClaim | *Version*:0.3.0 |
| Draft as of 2026-02-18 | *Computable Name*:ICVPQRtoICVPClaim |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ICVPQRtoICVPClaim",
  "url" : "http://smart.who.int/icvp/StructureMap/ICVPQRtoICVPClaim",
  "version" : "0.3.0",
  "name" : "ICVPQRtoICVPClaim",
  "status" : "draft",
  "date" : "2026-02-18T13:37:23+00:00",
  "publisher" : "WHO",
  "contact" : [
    {
      "name" : "WHO",
      "telecom" : [
        {
          "system" : "url",
          "value" : "http://who.int"
        }
      ]
    }
  ],
  "structure" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse",
      "mode" : "source",
      "alias" : "QuestionnaireResponse"
    },
    {
      "url" : "http://smart.who.int/icvp/StructureDefinition/ICVPMin",
      "mode" : "target",
      "alias" : "ICVPPayload"
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
    }
  ],
  "import" : [
    "http://smart.who.int/icvp/StructureMap/ICVPQRtoICVPLM",
    "http://smart.who.int/icvp/StructureMap/ICVPLMtoICVPClaim"
  ],
  "group" : [
    {
      "name" : "ICVPQRtoICVPClaim",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "qr",
          "type" : "QuestionnaireResponse",
          "mode" : "source"
        },
        {
          "name" : "ICVPClaim",
          "type" : "ICVPPayload",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "rule3",
          "source" : [
            {
              "context" : "qr"
            }
          ],
          "target" : [
            {
              "contextType" : "variable",
              "variable" : "model",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "http://smart.who.int/icvp/StructureDefinition/ICVP"
                }
              ]
            }
          ],
          "rule" : [
            {
              "name" : "rule1aa",
              "source" : [
                {
                  "context" : "qr"
                }
              ],
              "target" : [
                {
                  "context" : "ICVPClaim",
                  "contextType" : "variable"
                }
              ],
              "dependent" : [
                {
                  "name" : "ICVPQRtoICVPLM",
                  "variable" : ["qr", "model"]
                }
              ]
            },
            {
              "name" : "rule2",
              "source" : [
                {
                  "context" : "qr"
                }
              ],
              "target" : [
                {
                  "context" : "ICVPClaim",
                  "contextType" : "variable"
                }
              ],
              "dependent" : [
                {
                  "name" : "ICVPLMtoICVPClaim",
                  "variable" : ["model", "ICVPClaim"]
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}

```
