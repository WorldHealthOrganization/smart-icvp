# ICVP HCERT Payload - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Indices**](indices.md)
* [**Artifact Index**](artifacts.md)
* **ICVP HCERT Payload**

## Logical Model: ICVP HCERT Payload 

| | |
| :--- | :--- |
| *Official URL*:http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails | *Version*:0.3.0 |
| Active as of 2026-04-16 | *Computable Name*:ICVPMinVaccineDetails |

 
Minimal vaccine detail in DVC payload for use within an HCERT Payload using the ICVP Product Catalogue 

 
Satisfies the Section 2 (Vaccine or Prophylaxis) requirements captured in Requirements/ICVPRequirements. Derived/collapsed Annex 6 columns (disease name, manufacturer, coded batch) are resolved per REQ-DE-12, REQ-DE-16 and REQ-DE-18/19. 

**Usages:**

* Use this Logical Model: [ICVP HCERT Payload](StructureDefinition-ICVPMin.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/smart.who.int.icvp|current/StructureDefinition/ICVPMinVaccineDetails)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ICVPMinVaccineDetails.csv), [Excel](StructureDefinition-ICVPMinVaccineDetails.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ICVPMinVaccineDetails",
  "url" : "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails",
  "version" : "0.3.0",
  "name" : "ICVPMinVaccineDetails",
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
  "description" : "Minimal vaccine detail in DVC payload for use within an HCERT Payload using the ICVP Product Catalogue",
  "purpose" : "Satisfies the Section 2 (Vaccine or Prophylaxis) requirements captured in Requirements/ICVPRequirements. Derived/collapsed Annex 6 columns (disease name, manufacturer, coded batch) are resolved per REQ-DE-12, REQ-DE-16 and REQ-DE-18/19.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails",
  "baseDefinition" : "http://smart.who.int/trust-phw/StructureDefinition/DVCMinVaccineDetails",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ICVPMinVaccineDetails",
      "path" : "ICVPMinVaccineDetails",
      "short" : "ICVP HCERT Payload",
      "definition" : "Minimal vaccine detail in DVC payload for use within an HCERT Payload using the ICVP Product Catalogue"
    },
    {
      "id" : "ICVPMinVaccineDetails.vp",
      "path" : "ICVPMinVaccineDetails.vp",
      "comment" : "LOINC 39236-5; SNOMED CT 787859002.",
      "requirements" : "Satisfies REQ-DE-11 (ICVP.C5.DE.11) and REQ-CC-06. SHALL carry the identifier of the vaccine/prophylaxis product administered. Bound (required) to ICVPProductIds — a product outside this catalogue SHALL be rejected by ICVP.DT.1 / ICVP.DT.2. Disease (REQ-DE-12) and manufacturer (REQ-DE-16) are DERIVED from vp via the ICVP Product Catalogue and are NOT independently populated.",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://smart.who.int/icvp/ValueSet/ICVPProductIds"
      }
    },
    {
      "id" : "ICVPMinVaccineDetails.dv",
      "path" : "ICVPMinVaccineDetails.dv",
      "comment" : "LOINC 30952-6.",
      "requirements" : "Satisfies REQ-DE-13 (ICVP.C5.DE.13). SHALL be the calendar date on which the vaccine/prophylaxis was administered — the anchor for all temporal-validity calculations (REQ-DE-20, REQ-DE-21/22/23). SHALL NOT be later than the certificate's issuance date or the verification date; MAY precede the issuance date."
    },
    {
      "id" : "ICVPMinVaccineDetails.cn",
      "path" : "ICVPMinVaccineDetails.cn",
      "requirements" : "Satisfies REQ-DE-14 (ICVP.C5.DE.14) and contributes to REQ-CC-07. MAY carry the full name of the supervising clinician. Either cn or is (REQ-DE-15) SHALL be present — see invariant must-have-issuer-or-clinician-name on DVCMinVaccineDetails. This is the digital counterpart of the Annex 6 clinician name column, NOT of the wet-ink signature (REQ-CC-08)."
    },
    {
      "id" : "ICVPMinVaccineDetails.is",
      "path" : "ICVPMinVaccineDetails.is",
      "requirements" : "Satisfies REQ-DE-15 (ICVP.C5.DE.15) and contributes to REQ-CC-07 / REQ-CC-10. MAY carry the identifier of the relevant issuing authority; SHALL correspond to a participant in the GDHCN SMART Trust ValueSet-Participants. Either cn (REQ-DE-14) or is SHALL be present. Certificates intended for international border verification SHOULD populate is — without it, cryptographic verification through the GDHCN is not possible."
    },
    {
      "id" : "ICVPMinVaccineDetails.bo",
      "path" : "ICVPMinVaccineDetails.bo",
      "comment" : "LOINC 30959-1 'Lot number [Identifier] Vaccine'.",
      "requirements" : "Satisfies REQ-DE-17 (ICVP.C5.DE.17) and absorbs REQ-DE-18 (DE.18) and REQ-DE-19 (DE.19). SHALL carry the batch (lot) number as recorded by the manufacturer. Where a coded catalogue of batches is available, populate bo with the manufacturer's canonical batch identifier to preserve recall and pharmacovigilance traceability. SHALL NOT be omitted (Coexistence footnote 28)."
    }]
  }
}

```
