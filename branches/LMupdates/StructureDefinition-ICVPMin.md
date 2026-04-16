# ICVP HCERT Payload - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **ICVP HCERT Payload**

## Logical Model: ICVP HCERT Payload 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/StructureDefinition/ICVPMin | *Version*:0.3.0 |
| Active as of 2026-04-16 | *Computable Name*:ICVPMin |

 
Minimal DVC payload for use within an HCERT Payload using the ICVP Product Catalogue 

 
Satisfies the normative requirements captured in Requirements/ICVPRequirements (see input/pagecontent/system-requirements.md). Every data element below is cross-referenced to one or more REQ-CC / REQ-DE statements in that resource. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/smart.who.int.icvp|current/StructureDefinition/ICVPMin)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ICVPMin.csv), [Excel](StructureDefinition-ICVPMin.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ICVPMin",
  "url" : "http://smart.who.int/icvp/StructureDefinition/ICVPMin",
  "version" : "0.3.0",
  "name" : "ICVPMin",
  "title" : "ICVP HCERT Payload",
  "status" : "active",
  "date" : "2026-04-16T13:19:32+00:00",
  "publisher" : "WHO",
  "contact" : [{
    "name" : "WHO",
    "telecom" : [{
      "system" : "url",
      "value" : "http://who.int"
    }]
  }],
  "description" : "Minimal DVC payload for use within an HCERT Payload using the ICVP Product Catalogue",
  "purpose" : "Satisfies the normative requirements captured in Requirements/ICVPRequirements (see input/pagecontent/system-requirements.md). Every data element below is cross-referenced to one or more REQ-CC / REQ-DE statements in that resource.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://smart.who.int/icvp/StructureDefinition/ICVPMin",
  "baseDefinition" : "http://smart.who.int/trust-phw/StructureDefinition/DVCMin",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ICVPMin",
      "path" : "ICVPMin",
      "short" : "ICVP HCERT Payload",
      "definition" : "Minimal DVC payload for use within an HCERT Payload using the ICVP Product Catalogue"
    },
    {
      "id" : "ICVPMin.n",
      "path" : "ICVPMin.n",
      "comment" : "LOINC 87226-7 'Legal name of patient - first and last'. Language per REQ-CC-04 (English or French).",
      "requirements" : "Satisfies REQ-DE-01 (ICVP.A9.DE.1). SHALL carry the full name of the recipient, transcribed from the identity document used for travel, in the same form and order as it appears on that document."
    },
    {
      "id" : "ICVPMin.dob",
      "path" : "ICVPMin.dob",
      "comment" : "LOINC 21112-8; SNOMED CT 184099003.",
      "requirements" : "Satisfies REQ-DE-02 (ICVP.A9.DE.2). SHALL be recorded as a fully specified calendar date. Partial dates on identity documents are resolved per national policy."
    },
    {
      "id" : "ICVPMin.s",
      "path" : "ICVPMin.s",
      "comment" : "Mapping governed by the ICVP.Core ConceptMap.",
      "requirements" : "Satisfies REQ-DE-03 (ICVP.A9.DE.3). SHALL record the sex of the recipient. Bound (extensible) to FHIR AdministrativeGender (male/female/other/unknown). Values not in the core set SHALL be mapped to 'unknown' (ICVP.A9.DE.7) for interoperability."
    },
    {
      "id" : "ICVPMin.nt",
      "path" : "ICVPMin.nt",
      "comment" : "LOINC 69433-1; SNOMED CT 223369002.",
      "requirements" : "Satisfies REQ-DE-08 (ICVP.A9.DE.8). SHALL record a single ISO 3166-1 alpha-3 country code for the recipient's nationality. Stateless cases handled per national policy."
    },
    {
      "id" : "ICVPMin.id",
      "path" : "ICVPMin.id",
      "comment" : "LOINC 76435-7. Pairs with dt (document type).",
      "requirements" : "Satisfies REQ-DE-09 (ICVP.A9.DE.9) — document number component. MAY be populated per issuing State Party policy; SHOULD be populated where operationally feasible to support border-control identity binding (Coexistence 'Individual issuance'). Data-protection obligations per IHR Article 45 apply."
    },
    {
      "id" : "ICVPMin.dt",
      "path" : "ICVPMin.dt",
      "comment" : "Pairs with id (document number).",
      "requirements" : "Satisfies REQ-DE-09 (ICVP.A9.DE.9) — document type component. Bound (extensible) to the HL7 v2 identifier-type value set. Resolves Coexistence footnote 23 ambiguity by modelling document type alongside id (document number)."
    },
    {
      "id" : "ICVPMin.gn",
      "path" : "ICVPMin.gn",
      "comment" : "LOINC 79183-0; SNOMED CT 394619001.",
      "requirements" : "Satisfies REQ-DE-10 (ICVP.A9.DE.10). SHALL be present when the recipient is a minor or dependent (per issuing State Party policy); otherwise omitted. Where the parent/guardian holds their own travel identity document, record the name as it appears on that document. Wet-ink parent/guardian signature (Annex 6 non-digital) is not applicable — see REQ-CC-08."
    },
    {
      "id" : "ICVPMin.vx",
      "path" : "ICVPMin.vx",
      "requirements" : "Satisfies REQ-CC-02 and REQ-CC-03: container for the single vaccine/prophylaxis administration represented by this certificate. Multiple administrations SHALL be issued as separate Digital ICVPs.",
      "type" : [{
        "code" : "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails"
      }]
    },
    {
      "id" : "ICVPMin.v",
      "path" : "ICVPMin.v",
      "comment" : "Unrecognised versions SHOULD be treated as ambiguous, not rejected; verifier MAY fall back to the latest supported version and flag the discrepancy.",
      "requirements" : "Satisfies REQ-DE-27 (ICVP.D5.DE.27). SHALL carry a version identifier for the certificate template. Used by verifiers to select the human-readable text template (REQ-DE-24), apply version-appropriate validation logic, and determine compatibility."
    }]
  }
}

```
