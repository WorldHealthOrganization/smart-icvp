# ICVPLMToIPS - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **ICVPLMToIPS**

## StructureMap: ICVPLMToIPS 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/StructureMap/ICVPLMToIPS | *Version*:0.3.0 |
| Draft as of 2026-04-16 | *Computable Name*:ICVPLMToIPS |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ICVPLMToIPS",
  "url" : "http://smart.who.int/icvp/StructureMap/ICVPLMToIPS",
  "version" : "0.3.0",
  "name" : "ICVPLMToIPS",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "target",
    "alias" : "IPS",
    "documentation" : "uses \"http://smart.who.int/icvp/ConceptMap/ICVPProductIdToVaccineType\" alias ICVPProductIdToVaccineType as conceptmap"
  }],
  "group" : [{
    "name" : "ICVPLMToIPS",
    "documentation" : "create Bundle",
    "input" : [{
      "name" : "lm",
      "type" : "ICVPLogicalModel",
      "mode" : "source"
    },
    {
      "name" : "ips",
      "type" : "IPS",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "setIPSType",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "ips",
        "element" : "type",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "document"
        }]
      }]
    },
    {
      "name" : "setId",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "variable" : "bid",
        "transform" : "uuid"
      },
      {
        "context" : "ips",
        "element" : "identifier",
        "variable" : "id"
      },
      {
        "context" : "id",
        "element" : "value",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "bid"
        }]
      },
      {
        "context" : "id",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "urn:oid:2.16.724.4.8.10.200.10"
        }]
      }]
    },
    {
      "name" : "setEntries",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "variable" : "cid",
        "transform" : "uuid"
      },
      {
        "variable" : "pid",
        "transform" : "uuid"
      },
      {
        "variable" : "mid",
        "transform" : "uuid"
      },
      {
        "variable" : "aid",
        "transform" : "uuid"
      },
      {
        "variable" : "proid",
        "transform" : "uuid"
      },
      {
        "variable" : "immid",
        "transform" : "uuid"
      }],
      "rule" : [{
        "name" : "mapCompositionResource",
        "source" : [{
          "context" : "lm"
        }],
        "target" : [{
          "context" : "ips",
          "element" : "entry",
          "variable" : "entry"
        },
        {
          "context" : "entry",
          "element" : "resource",
          "variable" : "composition",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Composition"
          }]
        },
        {
          "context" : "entry",
          "element" : "fullUrl",
          "transform" : "append",
          "parameter" : [{
            "valueString" : "urn:uuid:"
          },
          {
            "valueId" : "cid"
          }]
        }],
        "rule" : [{
          "name" : "setLmToComposition",
          "source" : [{
            "context" : "lm"
          }],
          "dependent" : [{
            "name" : "LmToComposition",
            "parameter" : [{
              "valueId" : "lm"
            },
            {
              "valueId" : "ips"
            },
            {
              "valueId" : "composition"
            },
            {
              "valueId" : "cid"
            },
            {
              "valueId" : "pid"
            },
            {
              "valueId" : "mid"
            },
            {
              "valueId" : "aid"
            },
            {
              "valueId" : "proid"
            },
            {
              "valueId" : "immid"
            }]
          }]
        },
        {
          "name" : "mapPatientResource",
          "source" : [{
            "context" : "lm"
          }],
          "target" : [{
            "context" : "ips",
            "element" : "entry",
            "variable" : "entry"
          },
          {
            "context" : "entry",
            "element" : "fullUrl",
            "transform" : "append",
            "parameter" : [{
              "valueString" : "urn:uuid:"
            },
            {
              "valueId" : "pid"
            }]
          },
          {
            "variable" : "patient",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Patient"
            }]
          }],
          "rule" : [{
            "name" : "createPatient",
            "source" : [{
              "context" : "lm"
            }],
            "dependent" : [{
              "name" : "DemographicsToPatient",
              "parameter" : [{
                "valueId" : "lm"
              },
              {
                "valueId" : "patient"
              },
              {
                "valueId" : "pid"
              }]
            }]
          },
          {
            "name" : "setPatientEntry",
            "source" : [{
              "context" : "lm"
            }],
            "target" : [{
              "context" : "entry",
              "element" : "resource",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "patient"
              }]
            }]
          }]
        },
        {
          "name" : "ss",
          "source" : [{
            "context" : "lm",
            "element" : "issuer",
            "variable" : "issuer"
          }],
          "rule" : [{
            "name" : "mapOrganizationResource",
            "source" : [{
              "context" : "issuer",
              "element" : "reference",
              "variable" : "id"
            }],
            "target" : [{
              "context" : "ips",
              "element" : "entry",
              "variable" : "entry"
            },
            {
              "context" : "entry",
              "element" : "fullUrl",
              "transform" : "append",
              "parameter" : [{
                "valueString" : "urn:uuid:"
              },
              {
                "valueId" : "id"
              }]
            },
            {
              "variable" : "organization",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Organization"
              }]
            }],
            "rule" : [{
              "name" : "createOrganization",
              "source" : [{
                "context" : "lm"
              }],
              "target" : [{
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "organization"
                }]
              }],
              "dependent" : [{
                "name" : "createAuthor",
                "parameter" : [{
                  "valueId" : "issuer"
                },
                {
                  "valueId" : "organization"
                }]
              }]
            },
            {
              "name" : "setOrganizationEntry",
              "source" : [{
                "context" : "lm"
              }],
              "target" : [{
                "context" : "entry",
                "element" : "resource",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "organization"
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "LmToComposition",
    "documentation" : "create Composition",
    "input" : [{
      "name" : "lm",
      "type" : "ICVPLogicalModel",
      "mode" : "source"
    },
    {
      "name" : "ips",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "composition",
      "type" : "Composition",
      "mode" : "target"
    },
    {
      "name" : "cid",
      "mode" : "source"
    },
    {
      "name" : "pid",
      "mode" : "source"
    },
    {
      "name" : "mid",
      "mode" : "source"
    },
    {
      "name" : "aid",
      "mode" : "source"
    },
    {
      "name" : "proid",
      "mode" : "source"
    },
    {
      "name" : "immid",
      "mode" : "source"
    }],
    "rule" : [{
      "name" : "setCid",
      "source" : [{
        "context" : "cid"
      }],
      "target" : [{
        "context" : "composition",
        "element" : "id",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "cid"
        }]
      }]
    },
    {
      "name" : "setStatus",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "composition",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "setTitle",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "composition",
        "element" : "title",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "International Patient Summary"
        }]
      }]
    },
    {
      "name" : "setType",
      "source" : [{
        "context" : "lm"
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
          "valueString" : "60591-5"
        }]
      },
      {
        "context" : "coding",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://loinc.org"
        }]
      },
      {
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      },
      {
        "context" : "code",
        "element" : "coding",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "coding"
        }]
      },
      {
        "context" : "composition",
        "element" : "type",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "code"
        }]
      }]
    },
    {
      "name" : "setSubject",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "composition",
        "element" : "subject",
        "variable" : "subject"
      }],
      "rule" : [{
        "name" : "setSubject",
        "source" : [{
          "context" : "lm"
        }],
        "target" : [{
          "context" : "subject",
          "element" : "reference",
          "transform" : "append",
          "parameter" : [{
            "valueString" : "urn:uuid:"
          },
          {
            "valueId" : "pid"
          }]
        }]
      }]
    },
    {
      "name" : "setid",
      "source" : [{
        "context" : "lm",
        "element" : "issuer",
        "variable" : "issuer"
      }],
      "rule" : [{
        "name" : "setauthr",
        "source" : [{
          "context" : "issuer",
          "element" : "reference",
          "variable" : "id"
        }],
        "target" : [{
          "context" : "composition",
          "element" : "author",
          "variable" : "author"
        }],
        "rule" : [{
          "name" : "setAuthor",
          "source" : [{
            "context" : "id"
          }],
          "target" : [{
            "context" : "author",
            "element" : "reference",
            "transform" : "append",
            "parameter" : [{
              "valueString" : "urn:uuid:"
            },
            {
              "valueId" : "id"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "createMedication",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "composition",
        "element" : "section",
        "variable" : "medication"
      }],
      "dependent" : [{
        "name" : "createSectionMedications",
        "parameter" : [{
          "valueId" : "lm"
        },
        {
          "valueId" : "medication"
        },
        {
          "valueId" : "mid"
        }]
      }]
    },
    {
      "name" : "createAllergies",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "composition",
        "element" : "section",
        "variable" : "allergies"
      }],
      "dependent" : [{
        "name" : "createSectionAllergies",
        "parameter" : [{
          "valueId" : "lm"
        },
        {
          "valueId" : "allergies"
        },
        {
          "valueId" : "aid"
        }]
      }]
    },
    {
      "name" : "createProblems",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "composition",
        "element" : "section",
        "variable" : "problems"
      }],
      "dependent" : [{
        "name" : "createSectionProblems",
        "parameter" : [{
          "valueId" : "lm"
        },
        {
          "valueId" : "problems"
        },
        {
          "valueId" : "proid"
        }]
      }]
    },
    {
      "name" : "createImmunizations",
      "source" : [{
        "context" : "lm"
      }],
      "dependent" : [{
        "name" : "createSectionImmunizations",
        "parameter" : [{
          "valueId" : "lm"
        },
        {
          "valueId" : "ips"
        },
        {
          "valueId" : "composition"
        },
        {
          "valueId" : "immid"
        },
        {
          "valueId" : "pid"
        }]
      }]
    }]
  },
  {
    "name" : "DemographicsToPatient",
    "documentation" : "create Patient",
    "input" : [{
      "name" : "lm",
      "type" : "ICVPLogicalModel",
      "mode" : "source"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    },
    {
      "name" : "pid",
      "mode" : "source"
    }],
    "rule" : [{
      "name" : "setPatientId",
      "source" : [{
        "context" : "pid"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "id",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "pid"
        }]
      }]
    },
    {
      "name" : "Setname",
      "source" : [{
        "context" : "lm",
        "element" : "name",
        "variable" : "sourceName"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "name",
        "variable" : "targetName"
      }],
      "dependent" : [{
        "name" : "nameToHumanName",
        "parameter" : [{
          "valueId" : "sourceName"
        },
        {
          "valueId" : "targetName"
        }]
      }]
    },
    {
      "name" : "setDateofBirth",
      "source" : [{
        "context" : "lm",
        "element" : "dob",
        "variable" : "dob"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "birthDate",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "dob"
        }]
      }]
    },
    {
      "name" : "PatientGender",
      "source" : [{
        "context" : "lm",
        "element" : "sex",
        "variable" : "sex"
      }],
      "dependent" : [{
        "name" : "ExtractGender",
        "parameter" : [{
          "valueId" : "sex"
        },
        {
          "valueId" : "patient"
        }]
      }]
    },
    {
      "name" : "setNationalIdentifier",
      "source" : [{
        "context" : "lm",
        "element" : "nid",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "identifier",
        "variable" : "identifier"
      },
      {
        "context" : "identifier",
        "element" : "value",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "id"
        }]
      }],
      "documentation" : "lm.sex as sex -> patient.gender = sex \"setSex\";"
    },
    {
      "name" : "setGuardianName",
      "source" : [{
        "context" : "lm",
        "element" : "guardian",
        "variable" : "guardian"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "contact",
        "variable" : "parentContact"
      },
      {
        "context" : "parentContact",
        "element" : "name",
        "variable" : "parentName"
      }],
      "dependent" : [{
        "name" : "nameToHumanName",
        "parameter" : [{
          "valueId" : "guardian"
        },
        {
          "valueId" : "parentName"
        }]
      }]
    }]
  },
  {
    "name" : "ExtractGender",
    "documentation" : "deals with short and case sensitive codes",
    "input" : [{
      "name" : "sex",
      "mode" : "source"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "setMale",
      "source" : [{
        "context" : "sex",
        "condition" : "(sex = 'M')"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "gender",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "male"
        }]
      }]
    },
    {
      "name" : "setFemale",
      "source" : [{
        "context" : "sex",
        "condition" : "(sex = 'F')"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "gender",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "female"
        }]
      }]
    },
    {
      "name" : "setMale",
      "source" : [{
        "context" : "sex",
        "condition" : "(sex = 'm')"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "gender",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "male"
        }]
      }]
    },
    {
      "name" : "setFemale",
      "source" : [{
        "context" : "sex",
        "condition" : "(sex = 'f')"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "gender",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "female"
        }]
      }]
    },
    {
      "name" : "setMale",
      "source" : [{
        "context" : "sex",
        "condition" : "(sex = 'Male')"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "gender",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "male"
        }]
      }]
    },
    {
      "name" : "setFemale",
      "source" : [{
        "context" : "sex",
        "condition" : "(sex = 'Female')"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "gender",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "female"
        }]
      }]
    },
    {
      "name" : "setMale",
      "source" : [{
        "context" : "sex",
        "condition" : "(sex = 'male')"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "gender",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "male"
        }]
      }]
    },
    {
      "name" : "setFemale",
      "source" : [{
        "context" : "sex",
        "condition" : "(sex = 'female')"
      }],
      "target" : [{
        "context" : "patient",
        "element" : "gender",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "female"
        }]
      }]
    }]
  },
  {
    "name" : "createAuthor",
    "documentation" : "create author",
    "input" : [{
      "name" : "issuer",
      "mode" : "source"
    },
    {
      "name" : "org",
      "type" : "Organization",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "setID",
      "source" : [{
        "context" : "issuer",
        "element" : "reference",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "org",
        "element" : "id",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "id"
        }]
      }]
    }]
  },
  {
    "name" : "createSectionMedications",
    "documentation" : "create sectionMedications",
    "input" : [{
      "name" : "lm",
      "type" : "ICVPLogicalModel",
      "mode" : "source"
    },
    {
      "name" : "med",
      "type" : "BackboneElement",
      "mode" : "target"
    },
    {
      "name" : "mid",
      "mode" : "source"
    }],
    "rule" : [{
      "name" : "setmedicationid",
      "source" : [{
        "context" : "mid"
      }],
      "target" : [{
        "context" : "med",
        "element" : "id",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "mid"
        }]
      }]
    },
    {
      "name" : "setMedicationTitle",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "med",
        "element" : "title",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "Medication Summary Section"
        }]
      }]
    },
    {
      "name" : "setText",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "med",
        "element" : "text",
        "variable" : "text"
      }],
      "dependent" : [{
        "name" : "generateNarrativeText",
        "parameter" : [{
          "valueId" : "med"
        },
        {
          "valueId" : "text"
        }]
      }]
    },
    {
      "name" : "setCode",
      "source" : [{
        "context" : "lm"
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
          "valueString" : "10160-0"
        }]
      },
      {
        "context" : "coding",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://loinc.org"
        }]
      },
      {
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      },
      {
        "context" : "code",
        "element" : "coding",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "coding"
        }]
      },
      {
        "context" : "med",
        "element" : "code",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "code"
        }]
      }]
    },
    {
      "name" : "setCode",
      "source" : [{
        "context" : "lm"
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
          "valueString" : "unavailable"
        }]
      },
      {
        "context" : "coding",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://terminology.hl7.org/CodeSystem/list-empty-reason"
        }]
      },
      {
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      },
      {
        "context" : "code",
        "element" : "coding",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "coding"
        }]
      },
      {
        "context" : "med",
        "element" : "emptyReason",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "code"
        }]
      }]
    }]
  },
  {
    "name" : "createSectionAllergies",
    "documentation" : "create sectionAllergies",
    "input" : [{
      "name" : "lm",
      "type" : "ICVPLogicalModel",
      "mode" : "source"
    },
    {
      "name" : "all",
      "type" : "BackboneElement",
      "mode" : "target"
    },
    {
      "name" : "aid",
      "mode" : "source"
    }],
    "rule" : [{
      "name" : "setAllergyId",
      "source" : [{
        "context" : "aid"
      }],
      "target" : [{
        "context" : "all",
        "element" : "id",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "aid"
        }]
      }]
    },
    {
      "name" : "setAllergyTitle",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "all",
        "element" : "title",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "Allergies Section"
        }]
      }]
    },
    {
      "name" : "setText",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "all",
        "element" : "text",
        "variable" : "text"
      }],
      "dependent" : [{
        "name" : "generateNarrativeText",
        "parameter" : [{
          "valueId" : "all"
        },
        {
          "valueId" : "text"
        }]
      }]
    },
    {
      "name" : "setCode",
      "source" : [{
        "context" : "lm"
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
          "valueString" : "48765-2"
        }]
      },
      {
        "context" : "coding",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://loinc.org"
        }]
      },
      {
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      },
      {
        "context" : "code",
        "element" : "coding",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "coding"
        }]
      },
      {
        "context" : "all",
        "element" : "code",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "code"
        }]
      }]
    },
    {
      "name" : "setCode",
      "source" : [{
        "context" : "lm"
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
          "valueString" : "unavailable"
        }]
      },
      {
        "context" : "coding",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://terminology.hl7.org/CodeSystem/list-empty-reason"
        }]
      },
      {
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      },
      {
        "context" : "code",
        "element" : "coding",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "coding"
        }]
      },
      {
        "context" : "all",
        "element" : "emptyReason",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "code"
        }]
      }]
    }]
  },
  {
    "name" : "createSectionProblems",
    "documentation" : "create sectionProblems",
    "input" : [{
      "name" : "lm",
      "type" : "ICVPLogicalModel",
      "mode" : "source"
    },
    {
      "name" : "prb",
      "type" : "BackboneElement",
      "mode" : "target"
    },
    {
      "name" : "proid",
      "mode" : "source"
    }],
    "rule" : [{
      "name" : "setProblemsId",
      "source" : [{
        "context" : "proid"
      }],
      "target" : [{
        "context" : "prb",
        "element" : "id",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "proid"
        }]
      }]
    },
    {
      "name" : "setProblemTitle",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "prb",
        "element" : "title",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "Problems Section"
        }]
      }]
    },
    {
      "name" : "setText",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "prb",
        "element" : "text",
        "variable" : "text"
      }],
      "dependent" : [{
        "name" : "generateNarrativeText",
        "parameter" : [{
          "valueId" : "prb"
        },
        {
          "valueId" : "text"
        }]
      }]
    },
    {
      "name" : "setCode",
      "source" : [{
        "context" : "lm"
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
          "valueString" : "11450-4"
        }]
      },
      {
        "context" : "coding",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://loinc.org"
        }]
      },
      {
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      },
      {
        "context" : "code",
        "element" : "coding",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "coding"
        }]
      },
      {
        "context" : "prb",
        "element" : "code",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "code"
        }]
      }]
    },
    {
      "name" : "setCode",
      "source" : [{
        "context" : "lm"
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
          "valueString" : "unavailable"
        }]
      },
      {
        "context" : "coding",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://terminology.hl7.org/CodeSystem/list-empty-reason"
        }]
      },
      {
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      },
      {
        "context" : "code",
        "element" : "coding",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "coding"
        }]
      },
      {
        "context" : "prb",
        "element" : "emptyReason",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "code"
        }]
      }]
    }]
  },
  {
    "name" : "createSectionImmunizations",
    "documentation" : "create sectionImmunizations",
    "input" : [{
      "name" : "lm",
      "type" : "ICVPLogicalModel",
      "mode" : "source"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "composition",
      "type" : "Composition",
      "mode" : "target"
    },
    {
      "name" : "immid",
      "mode" : "source"
    },
    {
      "name" : "pid",
      "mode" : "source"
    }],
    "rule" : [{
      "name" : "set",
      "source" : [{
        "context" : "lm"
      }],
      "target" : [{
        "context" : "composition",
        "element" : "section",
        "variable" : "imm"
      }],
      "rule" : [{
        "name" : "setImmunizationsId",
        "source" : [{
          "context" : "immid"
        }],
        "target" : [{
          "context" : "imm",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "immid"
          }]
        }]
      },
      {
        "name" : "setImmunizationTitle",
        "source" : [{
          "context" : "lm"
        }],
        "target" : [{
          "context" : "imm",
          "element" : "title",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Immunizations Section"
          }]
        }]
      },
      {
        "name" : "setText",
        "source" : [{
          "context" : "lm"
        }],
        "target" : [{
          "context" : "imm",
          "element" : "text",
          "variable" : "text"
        }],
        "dependent" : [{
          "name" : "generateNarrativeText",
          "parameter" : [{
            "valueId" : "imm"
          },
          {
            "valueId" : "text"
          }]
        }]
      },
      {
        "name" : "setCode",
        "source" : [{
          "context" : "lm"
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
            "valueString" : "11369-6"
          }]
        },
        {
          "context" : "coding",
          "element" : "system",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://loinc.org"
          }]
        },
        {
          "variable" : "code",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        },
        {
          "context" : "code",
          "element" : "coding",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "coding"
          }]
        },
        {
          "context" : "imm",
          "element" : "code",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "code"
          }]
        }]
      },
      {
        "name" : "setImmz",
        "source" : [{
          "context" : "lm",
          "element" : "vaccineDetails",
          "variable" : "vax"
        }],
        "target" : [{
          "variable" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "bundle",
          "element" : "entry",
          "variable" : "entry"
        },
        {
          "context" : "entry",
          "element" : "fullUrl",
          "transform" : "append",
          "parameter" : [{
            "valueString" : "urn:uuid:"
          },
          {
            "valueId" : "id"
          }]
        },
        {
          "context" : "imm",
          "element" : "entry",
          "variable" : "sectionEntry"
        },
        {
          "context" : "sectionEntry",
          "element" : "reference",
          "transform" : "append",
          "parameter" : [{
            "valueString" : "urn:uuid:"
          },
          {
            "valueId" : "id"
          }]
        },
        {
          "context" : "entry",
          "element" : "resource",
          "variable" : "immunization",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Immunization"
          }]
        },
        {
          "context" : "immunization",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "id"
          }]
        }],
        "dependent" : [{
          "name" : "createImmunizationResource",
          "parameter" : [{
            "valueId" : "vax"
          },
          {
            "valueId" : "immunization"
          },
          {
            "valueId" : "pid"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "createImmunizationResource",
    "input" : [{
      "name" : "vax",
      "type" : "vaccineDetails",
      "mode" : "source"
    },
    {
      "name" : "immunization",
      "type" : "Immunization",
      "mode" : "target"
    },
    {
      "name" : "pid",
      "mode" : "source"
    }],
    "rule" : [{
      "name" : "setStatus",
      "source" : [{
        "context" : "vax"
      }],
      "target" : [{
        "context" : "immunization",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "completed"
        }]
      }]
    },
    {
      "name" : "setVaccine",
      "source" : [{
        "context" : "vax",
        "element" : "productID",
        "variable" : "vaccine"
      }],
      "rule" : [{
        "name" : "keepProductIdExt",
        "source" : [{
          "context" : "vaccine"
        }],
        "target" : [{
          "context" : "immunization",
          "element" : "extension",
          "variable" : "ext"
        },
        {
          "context" : "ext",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://smart.who.int/pcmt/StructureDefinition/ProductID"
          }]
        },
        {
          "context" : "ext",
          "element" : "value",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "vaccine"
          }]
        }],
        "documentation" : "Keep the original productID as-is in the extension"
      },
      {
        "name" : "mapVaxCode",
        "source" : [{
          "context" : "vaccine",
          "element" : "code",
          "variable" : "pcode"
        }],
        "target" : [{
          "variable" : "src",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        },
        {
          "context" : "src",
          "element" : "system",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://smart.who.int/pcmt-vaxprequal/CodeSystem/PreQualProductIds"
          }]
        },
        {
          "context" : "src",
          "element" : "code",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "pcode"
          }]
        },
        {
          "variable" : "vcoding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        },
        {
          "context" : "vcoding",
          "element" : "system",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://smart.who.int/pcmt-vaxprequal/CodeSystem/PreQualVaccineType"
          }]
        },
        {
          "context" : "vcoding",
          "element" : "code",
          "transform" : "translate",
          "parameter" : [{
            "valueId" : "src"
          },
          {
            "valueString" : "http://smart.who.int/icvp/ConceptMap/ICVPProductIdToVaccineType"
          },
          {
            "valueString" : "code"
          }]
        },
        {
          "variable" : "tgtVaccineCode",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        },
        {
          "context" : "tgtVaccineCode",
          "element" : "coding",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "vcoding"
          }]
        },
        {
          "context" : "immunization",
          "element" : "vaccineCode",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "tgtVaccineCode"
          }]
        }],
        "documentation" : "Normalize system just for translate(): CM source = .../PreQualProductIds (camel 'Ids')"
      }]
    },
    {
      "name" : "setDate",
      "source" : [{
        "context" : "vax",
        "element" : "date",
        "variable" : "date"
      }],
      "target" : [{
        "context" : "immunization",
        "element" : "occurrence",
        "transform" : "append",
        "parameter" : [{
          "valueId" : "date"
        },
        {
          "valueString" : "T00:00:00.000Z"
        }]
      }]
    },
    {
      "name" : "setBatchNo",
      "source" : [{
        "context" : "vax",
        "element" : "batchNo",
        "variable" : "batchNo"
      }],
      "rule" : [{
        "name" : "setBatchNoFromText",
        "source" : [{
          "context" : "batchNo",
          "element" : "text",
          "variable" : "text"
        }],
        "target" : [{
          "context" : "immunization",
          "element" : "lotNumber",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "text"
          }]
        }]
      }]
    },
    {
      "name" : "setProtocolApplied",
      "source" : [{
        "context" : "vax"
      }],
      "target" : [{
        "context" : "immunization",
        "element" : "protocolApplied",
        "variable" : "protocol"
      }],
      "rule" : [{
        "name" : "setTargetDisease",
        "source" : [{
          "context" : "vax",
          "element" : "disease",
          "variable" : "disease"
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
          "element" : "coding",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "disease"
          }]
        },
        {
          "context" : "protocol",
          "element" : "targetDisease",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "code"
          }]
        }]
      }]
    },
    {
      "name" : "setSubject",
      "source" : [{
        "context" : "vax"
      }],
      "target" : [{
        "context" : "immunization",
        "element" : "patient",
        "variable" : "subject"
      },
      {
        "context" : "subject",
        "element" : "reference",
        "transform" : "append",
        "parameter" : [{
          "valueString" : "urn:uuid:"
        },
        {
          "valueId" : "pid"
        }]
      }]
    },
    {
      "name" : "setManufacturer",
      "source" : [{
        "context" : "vax",
        "element" : "manufacturerId",
        "variable" : "maId"
      }],
      "target" : [{
        "variable" : "maRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "maRef",
        "element" : "identifier",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "maId"
        }]
      },
      {
        "context" : "immunization",
        "element" : "manufacturer",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "maRef"
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
          "valueString" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Narrative not available</div>"
        }]
      }]
    }]
  },
  {
    "name" : "nameToHumanName",
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
      "name" : "PatientName",
      "source" : [{
        "context" : "sourceName",
        "variable" : "patientName"
      }],
      "target" : [{
        "context" : "targetName",
        "element" : "text",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "patientName"
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
