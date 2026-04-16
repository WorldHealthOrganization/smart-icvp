# Discloure Statement maapings - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **Discloure Statement maapings**

## ConceptMap: Discloure Statement maapings 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/ConceptMap/DisclosureStatements | *Version*:0.3.0 |
| Active as of 2026-04-09 | *Computable Name*:DisclosureStatements |

 
Mapping from Disclosure Statements to itself to show relatiohships 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "DisclosureStatements",
  "url" : "http://smart.who.int/icvp/ConceptMap/DisclosureStatements",
  "version" : "0.3.0",
  "name" : "DisclosureStatements",
  "title" : "Discloure Statement maapings",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-04-09T07:40:36+00:00",
  "publisher" : "WHO",
  "contact" : [{
    "name" : "WHO",
    "telecom" : [{
      "system" : "url",
      "value" : "http://who.int"
    }]
  }],
  "description" : "Mapping from Disclosure Statements to itself to show relatiohships",
  "group" : [{
    "source" : "http://smart.who.int/icvp/ConceptMap/DisclosureStatements",
    "target" : "http://smart.who.int/icvp/ConceptMap/DisclosureStatements",
    "element" : [{
      "code" : "disclose-icvp-narrative",
      "target" : [{
        "code" : "disclose-icvp",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "disclose-icvp-demographic",
      "target" : [{
        "code" : "disclose-icvp",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "disclose-icvp-demographic-narrative",
      "target" : [{
        "code" : "disclose-icvp-demographic",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "disclose-icvp-demographic-name",
      "target" : [{
        "code" : "disclose-icvp-demographic",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "disclose-icvp-demographic-dob",
      "target" : [{
        "code" : "disclose-icvp-demographic",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "disclose-icvp-demographic-nationality",
      "target" : [{
        "code" : "disclose-icvp-demographic",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "disclose-icvp-demographic-national-id",
      "target" : [{
        "code" : "disclose-icvp-demographic",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "disclose-icvp-vaccination",
      "target" : [{
        "code" : "disclose-icvp",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "disclose-icvp-vaccination-narrative",
      "target" : [{
        "code" : "disclose-icvp-vaccination",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "disclose-icvp-vaccination-clinician-name",
      "target" : [{
        "code" : "disclose-icvp-vaccination",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "disclose-icvp-vaccination-issuer",
      "target" : [{
        "code" : "disclose-icvp-vaccination",
        "equivalence" : "wider"
      }]
    }]
  }]
}

```
