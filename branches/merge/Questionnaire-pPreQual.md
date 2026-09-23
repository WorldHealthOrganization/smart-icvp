# DVC Model Questionnaire - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **DVC Model Questionnaire**

## Example Questionnaire: DVC Model Questionnaire
Branch:



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "pPreQual",
  "meta" : {
    "profile" : [
      "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-extr-smap"
    ]
  },
  "url" : "http://smart.who.int/icvp/Questionnaire/pPreQual",
  "version" : "0.3.0",
  "status" : "active",
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
  "item" : [
    {
      "linkId" : "name",
      "text" : "Full Name of the client",
      "type" : "string",
      "required" : true,
      "repeats" : false
    },
    {
      "linkId" : "dob",
      "text" : "Date of Birth",
      "type" : "date",
      "required" : true,
      "repeats" : false
    },
    {
      "linkId" : "sex",
      "text" : "Sex",
      "type" : "choice",
      "required" : false,
      "repeats" : false,
      "answerValueSet" : "http://terminology.hl7.org/ValueSet/v2-0001"
    },
    {
      "linkId" : "nationality",
      "text" : "Nationality",
      "type" : "choice",
      "required" : false,
      "repeats" : false,
      "answerValueSet" : "http://terminology.hl7.org/ValueSet/v3-Country|3.0.0"
    },
    {
      "linkId" : "nid",
      "text" : "National Identification Document",
      "type" : "string",
      "required" : false,
      "repeats" : false
    },
    {
      "linkId" : "guardian",
      "text" : "Parent or Guardian Details",
      "type" : "group",
      "required" : false,
      "repeats" : false,
      "item" : [
        {
          "linkId" : "guardianName",
          "text" : "Name of Parent or Guardian",
          "type" : "string",
          "required" : false,
          "repeats" : false
        }
      ]
    },
    {
      "linkId" : "vaccineDetails",
      "text" : "Vaccine Certificate Details",
      "type" : "group",
      "required" : true,
      "repeats" : true,
      "item" : [
        {
          "linkId" : "productID",
          "text" : "Vaccine or Prophylaxis ID",
          "type" : "choice",
          "required" : true,
          "repeats" : false,
          "answerValueSet" : "http://smart.who.int/pcmt-vaxprequal/ValueSet/PreQualProductIds"
        },
        {
          "linkId" : "date",
          "text" : "Date of Vaccination",
          "type" : "date",
          "required" : true,
          "repeats" : false
        },
        {
          "linkId" : "clinicianName",
          "text" : "Name of supervising clinician",
          "type" : "string",
          "required" : false,
          "repeats" : false
        },
        {
          "linkId" : "issuer",
          "text" : "Relevant authoring reponsible for issuing the certificate, or for overseeing the administration center",
          "type" : "string",
          "required" : false,
          "repeats" : false
        },
        {
          "linkId" : "batchNo.text",
          "text" : "Batch Number",
          "type" : "string",
          "required" : true,
          "repeats" : false
        },
        {
          "linkId" : "validityPeriod",
          "text" : "Certificate Validity Period",
          "type" : "group",
          "required" : false,
          "repeats" : false,
          "item" : [
            {
              "linkId" : "startDate",
              "text" : "From",
              "type" : "date",
              "required" : false,
              "repeats" : false
            },
            {
              "linkId" : "endDate",
              "text" : "To",
              "type" : "date",
              "required" : false,
              "repeats" : false
            }
          ]
        }
      ]
    },
    {
      "linkId" : "attachment",
      "text" : "Upload Paper Form image or PDF",
      "type" : "attachment",
      "required" : false,
      "repeats" : false
    }
  ]
}

```
