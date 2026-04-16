// =============================================================================
// ICVP Requirements
// -----------------------------------------------------------------------------
// Regulatory and normative requirements governing each core data element of
// the Digital ICVP. Derived from:
//   - IHR (2005), as amended in 2014, 2022 and 2024 — Annex 6 and Annex 7
//   - WHO Coexistence Guidance (Table 2 and footnotes)
//   - WHO Specifications and standards for the Digital ICVP (Component 5)
//   - Digital ICVP Core Data Dictionary (ICVP.Core)
// See input/pagecontent/system-requirements.md for the full narrative source.
// =============================================================================

Instance:    ICVPRequirements
InstanceOf:  Requirements
Usage:       #definition
* url        = "http://smart.who.int/icvp/Requirements/ICVPRequirements"
* version    = "0.3.0"
* name       = "ICVPRequirements"
* title      = "Digital ICVP — Core Data Element Requirements"
* status     = #active
* experimental = false
* date       = "2026-04-16"
* publisher  = "WHO"
* contact.name = "WHO"
* contact.telecom.system = #url
* contact.telecom.value  = "http://who.int"
* description = "Normative requirements governing the core data elements of the Digital International Certificate of Vaccination or Prophylaxis (Digital ICVP). Each statement traces back to IHR (2005) Annex 6/7, the WHO Coexistence guidance, and the WHO Specifications for the Digital ICVP, and is linked via satisfiedBy to the corresponding ICVPMin / ICVPMinVaccineDetails element."
* purpose    = "Provide a machine-readable, traceable statement of the regulatory and normative requirements for the Digital ICVP, supporting conformance assessment of the ICVPMin logical model, profiles, value sets and decision-support logic defined in this IG."
* copyright  = "© World Health Organization, 2026. Licensed under CC-BY-SA-3.0-IGO."

// -----------------------------------------------------------------------------
// 1. Scope and Cross-Cutting Requirements (Annex 6 paragraphs 2–7)
// -----------------------------------------------------------------------------

* statement[+].key           = "REQ-CC-01"
* statement[=].label         = "No departure from the Model"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].requirement   = "The Digital ICVP SHALL conform to the Model ICVP specified in Annex 6. Implementations SHALL NOT add, remove or rename core data elements; they MAY extend the dictionary with additional local elements only where this does not displace or contradict any required element. Layout and colour of the digital background do not affect validity."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 §2; WHO Coexistence document §260306"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin"

* statement[+].key           = "REQ-CC-02"
* statement[=].label         = "Three logical sections"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].requirement   = "A Digital ICVP SHALL represent all three sections of the Model ICVP: (1) information about the recipient (ICVPMin.n, dob, s, nt, id, dt, gn — ICVP.A9.DE.1–A9.DE.10); (2) list of vaccine(s) or prophylaxis(es) administered (ICVPMin.vx / ICVPMinVaccineDetails — ICVP.C5.DE.11–C5.DE.19); (3) basic information to ascertain validity (ICVPMin.v and HCERT envelope — ICVP.D5.DE.20–D5.DE.27)."
* statement[=].derivedFrom   = "IHR (2005) Annex 6; WHO Coexistence document"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin"

* statement[+].key           = "REQ-CC-03"
* statement[=].label         = "Individuality of the certificate"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].requirement   = "A Digital ICVP instance SHALL describe exactly one recipient; bundling multiple recipients in a single signed payload is NOT PERMITTED. Each signed ICVPMin payload SHALL correspond to exactly one administered dose of one vaccine or prophylaxis product. Separate certificates SHALL be issued for children and for each administration."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 §7; WHO Coexistence document §260306"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin"

* statement[+].key           = "REQ-CC-04"
* statement[=].label         = "Language of completion"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].requirement   = "All required string-typed fields (e.g. ICVPMin.n, gn, vaccine details) SHALL be present in English or French. Implementations MAY carry parallel translations in additional languages; translations SHALL NOT replace the English or French representation."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 §5"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin"

* statement[+].key           = "REQ-CC-05"
* statement[=].label         = "No amendment or erasure"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].requirement   = "Once signed, the payload SHALL NOT be modified. Any required correction SHALL be issued as a new certificate. This is enforced through the cryptographic integrity check on the HCERT payload."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 §6"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin"

* statement[+].key           = "REQ-CC-06"
* statement[=].label         = "WHO-approved vaccine or prophylaxis"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].requirement   = "The product recorded in ICVPMinVaccineDetails.vp SHALL be drawn from the ICVP Product Catalogue (ICVPProductIds), derived from the WHO List of Prequalified Vaccines, the WHO Emergency Use Listing (EUL) procedure, and the WHO Prequalified Finished Pharmaceutical Products list. A certificate referencing a product not on this catalogue SHALL be deemed invalid by ICVP.DT.1 and ICVP.DT.2."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 §3"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/ValueSet/ICVPProductIds"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails"

* statement[+].key           = "REQ-CC-07"
* statement[=].label         = "Naming of the issuer"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].requirement   = "The certificate SHALL bear the name of the clinician supervising the administration or of the relevant authority responsible for issuing the certificate or overseeing the administering centre. In the minimal payload this is enforced by the invariant must-have-issuer-or-clinician-name on DVCMinVaccineDetails, requiring at least one of cn (REQ-DE-14) or is (REQ-DE-15) to be present."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 §4"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails"

* statement[+].key           = "REQ-CC-08"
* statement[=].label         = "Wet-ink artefacts not applicable"
* statement[=].conformance   = #SHOULD-NOT
* statement[=].conditionality = false
* statement[=].requirement   = "Recipient signature, guardian signature, clinician signature and official centre stamp apply only to the non-digital format and SHALL NOT be carried in the Digital ICVP payload. These are replaced by the HCERT cryptographic signature (REQ-DE-25)."
* statement[=].derivedFrom   = "WHO Coexistence document, Table 2"

* statement[+].key           = "REQ-CC-09"
* statement[=].label         = "Applicability"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].requirement   = "The Digital ICVP profiled in this IG SHALL be used only for certificates issued on or after 19 September 2025, and only for State Parties for which the 2024 amendments to the Model ICVP are in force."
* statement[=].derivedFrom   = "WHO Coexistence document, citing op. paragraph 2.(2) of WHA77.17"

* statement[+].key           = "REQ-CC-10"
* statement[=].label         = "Verifiability"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].requirement   = "A Digital ICVP SHALL be verifiable — its integrity and authenticity cryptographically validatable by any party in possession of the QR code payload and access to the GDHCN trust list, without recourse to the issuer. Verifiability is operationalised jointly by REQ-DE-25, REQ-DE-26, REQ-DE-15 and REQ-CC-05."
* statement[=].derivedFrom   = "WHO Coexistence document §260306"

* statement[+].key           = "REQ-CC-11"
* statement[=].label         = "Selective disclosure"
* statement[=].conformance   = #SHOULD
* statement[=].conditionality = true
* statement[=].requirement   = "The Digital ICVP SHOULD support selective disclosure, enabling the traveller to display only the relevant QR code or specific data required for inspection. Issuers delivering through a traveller-facing application SHOULD use the ICVPSD profile; issuers whose delivery channel is a single printed QR code MAY use the plain ICVPMin profile. Selective disclosure SHALL NOT be used to omit data elements designated Required by Table 2 at issuance time."
* statement[=].derivedFrom   = "WHO Coexistence document §260306"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPSD"

// -----------------------------------------------------------------------------
// 2. Section 1 — Information about the Recipient
// -----------------------------------------------------------------------------

* statement[+].key           = "REQ-DE-01"
* statement[=].label         = "Name of the recipient (ICVP.A9.DE.1 → ICVPMin.n)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-02"
* statement[=].requirement   = "The Digital ICVP SHALL carry the full name of the recipient of the vaccine or prophylaxis, transcribed usually from the identity document the recipient intends to use for travel. The recipient is the natural person who actually received the vaccine (subject). The issuer SHALL record the name in the same form and order as it appears in the name field of the identity document used for travel. Coding: ICVP.Core #ICVP.A9.DE.1; LOINC 87226-7. Cardinality 1..1, type string, Required."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 Model ICVP; WHO Coexistence Table 2"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin#ICVPMin.n"

* statement[+].key           = "REQ-DE-02"
* statement[=].label         = "Date of birth (ICVP.A9.DE.2 → ICVPMin.dob)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-02"
* statement[=].requirement   = "The recipient's date of birth SHALL be recorded as a fully specified calendar date. Where the identity document shows a partial date (e.g. only a year), the issuer SHOULD apply national policy to complete the field. Coding: ICVP.Core #ICVP.A9.DE.2; LOINC 21112-8; SNOMED CT 184099003. Cardinality 1..1, type date, Required."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 Model ICVP; WHO Coexistence Table 2"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin#ICVPMin.dob"

* statement[+].key           = "REQ-DE-03"
* statement[=].label         = "Sex (ICVP.A9.DE.3 → ICVPMin.s)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-02"
* statement[=].requirement   = "The Digital ICVP SHALL record the sex of the recipient. Bound (extensible) to FHIR AdministrativeGender (male/female/other/unknown) via the mappings defined in the ICVP.Core ConceptMap. Usually the value corresponds to the sex indicated on the identity document; values that do not map directly (e.g. 'X' on some passports) MAY be extended or mapped to an existing permissible value. For interoperability, extended values not in the core value set SHALL be mapped to 'unknown' (ICVP.A9.DE.7). Coding: ICVP.Core #ICVP.A9.DE.3. Cardinality 1..1, type code, Required."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 Model ICVP; WHO Coexistence Table 2; ICVP Core Data Dictionary"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin#ICVPMin.s"

* statement[+].key           = "REQ-DE-08"
* statement[=].label         = "Nationality (ICVP.A9.DE.8 → ICVPMin.nt)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-02"
* statement[=].requirement   = "The Digital ICVP SHALL record the nationality of the recipient as an ISO 3166-1 alpha-3 country code (extensible). ICVPMin.nt is cardinality 1..1 — the minimal payload records a single nationality, usually the one on the recipient's identity document. Cases where nationality cannot be established (e.g. stateless persons) SHOULD be handled according to national policy. Coding: ICVP.Core #ICVP.A9.DE.8; LOINC 69433-1; SNOMED CT 223369002. Type code, Required."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 Model ICVP; WHO Coexistence Table 2"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin#ICVPMin.nt"

* statement[+].key           = "REQ-DE-09"
* statement[=].label         = "National identification document (ICVP.A9.DE.9 → ICVPMin.id + ICVPMin.dt)"
* statement[=].conformance   = #MAY
* statement[=].conformance   = #SHOULD
* statement[=].conditionality = true
* statement[=].parent        = "REQ-CC-02"
* statement[=].requirement   = "The Digital ICVP MAY carry an identifier from an official national identity document (e.g. national ID card, passport). Inclusion is governed by the policy of the issuing State Party. The Coexistence document endorses this element for identity binding at border control ('inspection of the ICVP vis-à-vis the national identification document, if applicable'), so issuers SHOULD populate it wherever operationally feasible. To resolve the Model ICVP ambiguity (footnote 23) between document number and document type, the IG supports both: id (0..1, string — document number) and dt (0..1, code — document type bound to HL7 v2 $identifierTypeVS, extensible). Implementations SHOULD populate both where available, and SHALL ensure any identifier carried complies with the data-protection regime of the issuing State Party (IHR Article 45). Coding: ICVP.Core #ICVP.A9.DE.9; LOINC 76435-7. Optional / If applicable."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 Model ICVP; IHR Article 45; WHO Coexistence Table 2 and footnote 23; Coexistence 'Individual issuance' validity criterion"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin#ICVPMin.id"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin#ICVPMin.dt"

* statement[+].key           = "REQ-DE-10"
* statement[=].label         = "Name of the parent or guardian (ICVP.A9.DE.10 → ICVPMin.gn)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = true
* statement[=].parent        = "REQ-CC-02"
* statement[=].requirement   = "The Digital ICVP SHALL carry the full name of the parent or guardian when applicable — that is, when the recipient is a minor or dependent, as defined by the policy of the issuing State Party. Where applicable, gn SHALL be present; otherwise it SHALL be omitted. Where the parent/guardian holds their own travel identity document, the issuer SHOULD record the name as it appears on that document, to facilitate border-control identity binding. The wet-ink signature of a parent or guardian required by Annex 6 for non-digital ICVPs is not applicable in the digital format (REQ-CC-08). Coding: ICVP.Core #ICVP.A9.DE.10; LOINC 79183-0; SNOMED CT 394619001. Cardinality 0..1, type string, Required if applicable (Conditional)."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 Model ICVP; WHO Coexistence Table 2; ICVP Core Data Dictionary"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin#ICVPMin.gn"

// -----------------------------------------------------------------------------
// 3. Section 2 — Vaccine or Prophylaxis Administered
// -----------------------------------------------------------------------------

* statement[+].key           = "REQ-DE-11"
* statement[=].label         = "Vaccine or prophylaxis (ICVP.C5.DE.11 → ICVPMinVaccineDetails.vp)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-06"
* statement[=].requirement   = "The Digital ICVP SHALL carry the identifier of the vaccine or prophylaxis product administered. vp is bound with strength required to ICVPProductIds (the curated ICVP Product Catalogue derived from the WHO List of Prequalified Vaccines, the WHO EUL procedure, and the WHO Prequalified Finished Pharmaceutical Products list). A certificate carrying a value outside ICVPProductIds SHALL be rejected as invalid by ICVP.DT.1 (yellow fever), ICVP.DT.2 (poliovirus) and any future Annex 7 disease-specific tables. The name of disease (ICVP.C5.DE.12) and manufacturer (ICVP.C5.DE.16) are NOT separately populated — verifiers SHALL derive them from vp via the ICVP Product Catalogue. Coding: ICVP.Core #ICVP.C5.DE.11; LOINC 39236-5; SNOMED CT 787859002. Cardinality 1..1, type code, Required."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 Model ICVP §3; WHO Coexistence Table 2 and footnotes 25–27"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails#ICVPMinVaccineDetails.vp"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/ValueSet/ICVPProductIds"

* statement[+].key           = "REQ-DE-12"
* statement[=].label         = "Name of disease or condition — derived (ICVP.C5.DE.12)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-DE-11"
* statement[=].requirement   = "ICVP.C5.DE.12 (name of disease or condition) is NOT independently populated in ICVPMinVaccineDetails. Verifiers SHALL derive it deterministically from vp via the ICVP Product Catalogue. Issuers MAY display the derived value on the human-readable view but SHALL NOT carry it in the signed payload."
* statement[=].derivedFrom   = "WHO Coexistence footnotes 25–27; ICVP Core Data Dictionary validation rule 'Must correspond to the disease targeted by the selected vaccine or prophylaxis product'"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/ValueSet/ICVPProductIds"

* statement[+].key           = "REQ-DE-13"
* statement[=].label         = "Date of vaccination (ICVP.C5.DE.13 → ICVPMinVaccineDetails.dv)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-02"
* statement[=].requirement   = "The Digital ICVP SHALL carry the date on which the vaccine or prophylaxis was administered, as a full calendar date. This date is the anchor for all temporal-validity calculations (see REQ-DE-20, REQ-DE-21/22/23). The administration date SHALL NOT be later than the certificate's issuance date and SHALL NOT be later than the date the certificate is presented for verification. The administration date MAY precede the issuance date. Coding: ICVP.Core #ICVP.C5.DE.13; LOINC 30952-6. Cardinality 1..1, type date, Required."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 Model ICVP"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails#ICVPMinVaccineDetails.dv"

* statement[+].key           = "REQ-DE-14"
* statement[=].label         = "Name of supervising clinician (ICVP.C5.DE.14 → ICVPMinVaccineDetails.cn)"
* statement[=].conformance   = #MAY
* statement[=].conditionality = true
* statement[=].parent        = "REQ-CC-07"
* statement[=].requirement   = "The Digital ICVP MAY carry the full name of the medical practitioner or other authorised health worker who supervised the administration. This field is the digital counterpart of the 'Name of supervising clinician' column in the Annex 6 Model table — but NOT of the wet-ink signature, which is not applicable in the digital format (REQ-CC-08). Either cn (this field) or is (REQ-DE-15) SHALL be present, per the invariant must-have-issuer-or-clinician-name on DVCMinVaccineDetails. Coding: ICVP.Core #ICVP.C5.DE.14. Cardinality 0..1, type string, Conditional."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 §4; Annex 6 Model ICVP; WHO Coexistence Table 2; ICVP Core Data Dictionary"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails#ICVPMinVaccineDetails.cn"

* statement[+].key           = "REQ-DE-15"
* statement[=].label         = "Issuing authority (ICVP.C5.DE.15 → ICVPMinVaccineDetails.is)"
* statement[=].conformance   = #MAY
* statement[=].conformance   = #SHOULD
* statement[=].conditionality = true
* statement[=].parent        = "REQ-CC-07"
* statement[=].requirement   = "The Digital ICVP MAY carry the identifier of the relevant authority responsible for issuing the certificate or overseeing the administering centre. This identifier SHALL correspond to a participant onboarded to the WHO Global Digital Health Certification Network (GDHCN) trust framework, as expressed in the SMART Trust ValueSet-Participants — this binding is what makes cryptographic verification possible at the border. Either cn (REQ-DE-14) or is (this field) SHALL be present, per the invariant must-have-issuer-or-clinician-name on DVCMinVaccineDetails. Certificates intended for international border verification SHOULD populate is — without it, the certificate cannot be cryptographically verified through the GDHCN. Coding: ICVP.Core #ICVP.C5.DE.15. Cardinality 0..1, type id, Conditional."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 §4; WHO Coexistence Table 2; ICVP Core Data Dictionary validation condition"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails#ICVPMinVaccineDetails.is"

* statement[+].key           = "REQ-DE-16"
* statement[=].label         = "Manufacturer of vaccine or prophylaxis — derived (ICVP.C5.DE.16)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-DE-11"
* statement[=].requirement   = "ICVP.C5.DE.16 (manufacturer) is NOT independently populated in ICVPMinVaccineDetails. It is derived at verification time from vp via the ICVP Product Catalogue. Issuers MAY display the derived manufacturer on the human-readable view but SHALL NOT carry it in the signed payload."
* statement[=].derivedFrom   = "WHO Coexistence footnote 27"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/ValueSet/ICVPProductIds"

* statement[+].key           = "REQ-DE-17"
* statement[=].label         = "Batch number (ICVP.C5.DE.17 → ICVPMinVaccineDetails.bo)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-02"
* statement[=].requirement   = "The Digital ICVP SHALL carry the batch (lot) number of the vaccine or prophylaxis administered, as recorded by the manufacturer. The minimal payload collapses DE.18 (string) and DE.19 (coded) into a single string field bo for HCERT compactness; where a coded catalogue of batches is available, the issuer SHOULD still populate bo with the manufacturer's canonical batch identifier so that recall and pharmacovigilance lookups remain possible. bo SHALL NOT be omitted, even where national policy might otherwise treat batch as administrative metadata (Coexistence footnote 28: 'The batch No. [number] is required.'). Coding: ICVP.Core #ICVP.C5.DE.17; LOINC 30959-1. Cardinality 1..1, type string, Required."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 Model ICVP ('Manufacturer and batch No.'); WHO Coexistence Table 2 and footnotes 27–28"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails#ICVPMinVaccineDetails.bo"

* statement[+].key           = "REQ-DE-18"
* statement[=].label         = "Batch number (string) — collapsed (ICVP.C5.DE.18)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-DE-17"
* statement[=].requirement   = "ICVP.C5.DE.18 (batch number, string representation) is collapsed into the single field bo (REQ-DE-17) in ICVPMinVaccineDetails."
* statement[=].derivedFrom   = "ICVP Core Data Dictionary"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails#ICVPMinVaccineDetails.bo"

* statement[+].key           = "REQ-DE-19"
* statement[=].label         = "Batch number (coded) — collapsed / out of scope (ICVP.C5.DE.19)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-DE-17"
* statement[=].requirement   = "ICVP.C5.DE.19 (batch number, coded representation) is collapsed into bo (REQ-DE-17). Coded batch representations are out of scope for the minimal HCERT payload."
* statement[=].derivedFrom   = "ICVP Core Data Dictionary"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMinVaccineDetails#ICVPMinVaccineDetails.bo"

// -----------------------------------------------------------------------------
// 4. Section 3 — Basic Information to Ascertain Validity
// -----------------------------------------------------------------------------

* statement[+].key           = "REQ-DE-20"
* statement[=].label         = "Certificate valid from (ICVP.D5.DE.20)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-02"
* statement[=].requirement   = "The Digital ICVP SHALL carry a 'valid from' date, carried in the HCERT envelope (issued-at / not-before claim). Per Coexistence footnote 30, this date is CALCULATED from the date of administration (ICVPMinVaccineDetails.dt, REQ-DE-13) according to disease-specific rules. For yellow fever, Annex 7 §2.(a).(iv) sets the offset at ten days after the date of vaccination. Issuer implementations SHALL compute this date deterministically using the rules embedded in ICVP.DT.1 (yellow fever) and ICVP.DT.2 (poliovirus). The certificate SHALL NOT be presented as valid before this date. Coding: ICVP.Core #ICVP.D5.DE.20. Type date, cardinality 1..1, Required."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 Model ICVP; IHR (2005) Annex 7 §2.(a).(iv); WHO Coexistence Table 2 and footnote 30"

* statement[+].key           = "REQ-DE-21"
* statement[=].label         = "Certificate valid until — selector (ICVP.D5.DE.21)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-02"
* statement[=].requirement   = "The Digital ICVP SHALL carry a 'valid until' value for each vaccine or prophylaxis recorded, modelled as a discriminated union with two variants: lifetime (DE.22, string) and bounded (DE.23, date). Encoding is carried in the HCERT envelope (expires-at claim, with disease-specific encoding). Coding: ICVP.Core #ICVP.D5.DE.21. Cardinality 1..1, Required."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 Model ICVP; WHO Coexistence Table 2 and footnote 29"

* statement[+].key           = "REQ-DE-22"
* statement[=].label         = "Certificate valid until — lifetime variant (ICVP.D5.DE.22)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = true
* statement[=].parent        = "REQ-DE-21"
* statement[=].requirement   = "Used when the vaccine confers lifelong protection. Per Coexistence footnote 29 and Annex 7 §2.(a).(iii), one full dose of yellow-fever vaccine confers lifelong protection; the value SHALL be encoded as the literal string 'life of person vaccinated' (English) or 'vie entière du sujet vacciné' (French), in conformance with REQ-CC-04. No other free-text values are permitted. Coding: ICVP.Core #ICVP.D5.DE.22. Type string."
* statement[=].derivedFrom   = "IHR (2005) Annex 7 §2.(a).(iii); WHO Coexistence footnote 29"

* statement[+].key           = "REQ-DE-23"
* statement[=].label         = "Certificate valid until — bounded variant (ICVP.D5.DE.23)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = true
* statement[=].parent        = "REQ-DE-21"
* statement[=].requirement   = "Used for vaccines whose protection is time-limited. The value SHALL be a full calendar date computed from dt (REQ-DE-13) according to the disease-specific rule. Per Coexistence footnote 30, the 'valid until' date SHALL be computed by the issuer from the administration date and the applicable disease-specific rule; it SHALL NOT be entered manually in a way that contradicts the rule. The certificate SHALL be deemed invalid by the verifier on or after the day following this date, except where the lifetime variant (REQ-DE-22) is in use. Coding: ICVP.Core #ICVP.D5.DE.23. Type date."
* statement[=].derivedFrom   = "IHR (2005) Annex 7 §2.(a).(iii)–(iv); WHO Coexistence footnote 30"

* statement[+].key           = "REQ-DE-24"
* statement[=].label         = "Standard text following the Annex 6 table (ICVP.D5.DE.24)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-02"
* statement[=].requirement   = "Annex 6 prescribes literal text that SHALL appear following the vaccine table on every Model ICVP. The Digital ICVP SHALL display this text on its human-readable view, in English or French (REQ-CC-04). The wording is fixed by Annex 6 and SHALL NOT be paraphrased — it includes the WHO-approval qualifier, the rules on amendment and erasure, and the language-of-completion rule. Because this text is invariant and fully determined by the Model ICVP, it is NOT carried as a payload field in ICVPMin — it is rendered by the verifier or human-readable viewer from a static template keyed off the certificate Version (REQ-DE-27). Implementations SHALL keep the text in their presentation layer synchronised with the version of Annex 6 to which the certificate conforms. Coding: ICVP.Core #ICVP.D5.DE.24. Type string (fixed), cardinality 1..1, Required."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 Model ICVP (text following the table); WHO Coexistence Table 2"

* statement[+].key           = "REQ-DE-25"
* statement[=].label         = "Cryptographic signature of the issuer (ICVP.D5.DE.25)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-10"
* statement[=].requirement   = "The Digital ICVP SHALL be cryptographically signed by the issuing authority. The signature SHALL be applied over the canonical encoding of the ICVPMin payload using the GDHCN signing conventions (COSE_Sign1 over the HCERT CBOR payload). The signature is the digital substitute for the Annex 6 wet-ink artefacts identified as not applicable in REQ-CC-08. Per REQ-CC-05, once signed, the payload SHALL NOT be modified. Coding: ICVP.Core #ICVP.D5.DE.25. Carried in HCERT envelope (COSE_Sign1 signature)."
* statement[=].derivedFrom   = "IHR (2005) Annex 6 §4–§6; WHO Coexistence Table 2 ('Integrity Check' row, footnote 32)"

* statement[+].key           = "REQ-DE-26"
* statement[=].label         = "Key identifier for signature verification (ICVP.D5.DE.26)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-10"
* statement[=].requirement   = "The Digital ICVP SHALL carry a key identifier that allows the verifier to locate the issuer's public key in the GDHCN trust list. The identifier SHALL be resolvable to a participant in the SMART Trust ValueSet-Participants (cross-referenced by REQ-DE-15). Verifier implementations SHALL use this identifier to retrieve the public key and validate the signature; if the key cannot be resolved or is no longer trusted, the verifier SHALL treat the certificate as non-authentic. Coding: ICVP.Core #ICVP.D5.DE.26. Carried in HCERT envelope (COSE kid header)."
* statement[=].derivedFrom   = "WHO Coexistence Table 2 ('Integrity Check')"

* statement[+].key           = "REQ-DE-27"
* statement[=].label         = "Version (ICVP.D5.DE.27 → ICVPMin.v)"
* statement[=].conformance   = #SHALL
* statement[=].conditionality = false
* statement[=].parent        = "REQ-CC-02"
* statement[=].requirement   = "The Digital ICVP SHALL carry a version identifier for the certificate template, indicating the version of the Specifications document and the corresponding Model ICVP to which the certificate conforms. Verifiers SHALL use v to (a) select the correct human-readable text template for REQ-DE-24, (b) apply version-appropriate validation logic (data dictionary, decision-support tables, value sets), and (c) determine compatibility with the verifier's own implementation. A certificate carrying a v value that the verifier does not recognise SHOULD be treated as ambiguous rather than rejected outright: the verifier MAY fall back to the latest version it supports and flag the discrepancy to the inspector for human judgement. Coding: ICVP.Core #ICVP.D5.DE.27. Cardinality 1..1, type string, Required."
* statement[=].derivedFrom   = "WHO Coexistence Table 2 and footnote 33"
* statement[=].satisfiedBy   = "http://smart.who.int/icvp/StructureDefinition/ICVPMin#ICVPMin.v"
