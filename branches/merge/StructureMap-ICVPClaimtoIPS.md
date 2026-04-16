# ICVPClaimtoIPS - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **ICVPClaimtoIPS**

## StructureMap: ICVPClaimtoIPS 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/StructureMap/ICVPClaimtoIPS | *Version*:0.3.0 |
| Draft as of 2026-02-18 | *Computable Name*:ICVPClaimtoIPS |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ICVPClaimtoIPS",
  "url" : "http://smart.who.int/icvp/StructureMap/ICVPClaimtoIPS",
  "version" : "0.3.0",
  "name" : "ICVPClaimtoIPS",
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
    }
  ],
  "import" : [
    "http://smart.who.int/icvp/StructureMap/ICVPLMToIPS",
    "http://smart.who.int/icvp/StructureMap/ICVPClaimtoICVPLM"
  ],
  "group" : [
    {
      "name" : "ICVPClaimtoIPS",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "ICVPClaim",
          "type" : "ICVPPayload",
          "mode" : "source"
        },
        {
          "name" : "IPS",
          "type" : "Bundle",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "rule3",
          "source" : [
            {
              "context" : "ICVPClaim"
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
              "name" : "rule1",
              "source" : [
                {
                  "context" : "ICVPClaim"
                }
              ],
              "target" : [
                {
                  "context" : "model",
                  "contextType" : "variable"
                }
              ],
              "dependent" : [
                {
                  "name" : "ICVPClaimtoICVPLM",
                  "variable" : ["ICVPClaim", "model"]
                }
              ]
            },
            {
              "name" : "rule2",
              "source" : [
                {
                  "context" : "ICVPClaim"
                }
              ],
              "target" : [
                {
                  "context" : "IPS",
                  "contextType" : "variable"
                }
              ],
              "dependent" : [
                {
                  "name" : "ICVPLMToIPS",
                  "variable" : ["model", "IPS"]
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
