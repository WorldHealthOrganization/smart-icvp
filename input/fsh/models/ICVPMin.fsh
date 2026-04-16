
Logical:         ICVPMin
Parent:          $DVCMin
Title:           "ICVP HCERT Payload"
Description:     "Minimal DVC payload for use within an HCERT Payload using the ICVP Product Catalogue"
* ^status = #active
//* ^url = "http://smart.who.int/icvp/StructureDefinition/DVCPayload"
* ^version = "1"
* ^abstract = false
* ^purpose = "Satisfies the normative requirements captured in Requirements/ICVPRequirements (see input/pagecontent/system-requirements.md). Every data element below is cross-referenced to one or more REQ-CC / REQ-DE statements in that resource."

// Section 1 — Information about the Recipient -------------------------------
// REQ-DE-01 · ICVP.A9.DE.1 — Full legal name of the recipient (1..1, string).
* n ^requirements = "Satisfies REQ-DE-01 (ICVP.A9.DE.1). SHALL carry the full name of the recipient, transcribed from the identity document used for travel, in the same form and order as it appears on that document."
* n ^comment = "LOINC 87226-7 'Legal name of patient - first and last'. Language per REQ-CC-04 (English or French)."

// REQ-DE-02 · ICVP.A9.DE.2 — Date of birth (1..1, date).
* dob ^requirements = "Satisfies REQ-DE-02 (ICVP.A9.DE.2). SHALL be recorded as a fully specified calendar date. Partial dates on identity documents are resolved per national policy."
* dob ^comment = "LOINC 21112-8; SNOMED CT 184099003."

// REQ-DE-03 · ICVP.A9.DE.3 — Sex (1..1, code, extensible to AdministrativeGender).
* s ^requirements = "Satisfies REQ-DE-03 (ICVP.A9.DE.3). SHALL record the sex of the recipient. Bound (extensible) to FHIR AdministrativeGender (male/female/other/unknown). Values not in the core set SHALL be mapped to 'unknown' (ICVP.A9.DE.7) for interoperability."
* s ^comment = "Mapping governed by the ICVP.Core ConceptMap."

// REQ-DE-08 · ICVP.A9.DE.8 — Nationality (1..1, code, extensible to ISO 3166-1 alpha-3).
* nt ^requirements = "Satisfies REQ-DE-08 (ICVP.A9.DE.8). SHALL record a single ISO 3166-1 alpha-3 country code for the recipient's nationality. Stateless cases handled per national policy."
* nt ^comment = "LOINC 69433-1; SNOMED CT 223369002."

// REQ-DE-09 · ICVP.A9.DE.9 — National identification document number (0..1, string).
* id ^requirements = "Satisfies REQ-DE-09 (ICVP.A9.DE.9) — document number component. MAY be populated per issuing State Party policy; SHOULD be populated where operationally feasible to support border-control identity binding (Coexistence 'Individual issuance'). Data-protection obligations per IHR Article 45 apply."
* id ^comment = "LOINC 76435-7. Pairs with dt (document type)."

// REQ-DE-09 · ICVP.A9.DE.9 — National identification document type (0..1, code).
* dt ^requirements = "Satisfies REQ-DE-09 (ICVP.A9.DE.9) — document type component. Bound (extensible) to the HL7 v2 identifier-type value set. Resolves Coexistence footnote 23 ambiguity by modelling document type alongside id (document number)."
* dt ^comment = "Pairs with id (document number)."

// REQ-DE-10 · ICVP.A9.DE.10 — Parent or guardian name (0..1, string, conditional).
* gn ^requirements = "Satisfies REQ-DE-10 (ICVP.A9.DE.10). SHALL be present when the recipient is a minor or dependent (per issuing State Party policy); otherwise omitted. Where the parent/guardian holds their own travel identity document, record the name as it appears on that document. Wet-ink parent/guardian signature (Annex 6 non-digital) is not applicable — see REQ-CC-08."
* gn ^comment = "LOINC 79183-0; SNOMED CT 394619001."

// Section 3 — Basic Information to Ascertain Validity -----------------------
// REQ-DE-27 · ICVP.D5.DE.27 — Version (1..1, string).
* v ^requirements = "Satisfies REQ-DE-27 (ICVP.D5.DE.27). SHALL carry a version identifier for the certificate template. Used by verifiers to select the human-readable text template (REQ-DE-24), apply version-appropriate validation logic, and determine compatibility."
* v ^comment = "Unrecognised versions SHOULD be treated as ambiguous, not rejected; verifier MAY fall back to the latest supported version and flag the discrepancy."

// Section 2 — Vaccine or Prophylaxis Administered ---------------------------
// REQ-CC-03 — One signed payload per administered dose.
* vx only ICVPMinVaccineDetails
* vx ^requirements = "Satisfies REQ-CC-02 and REQ-CC-03: container for the single vaccine/prophylaxis administration represented by this certificate. Multiple administrations SHALL be issued as separate Digital ICVPs."



Logical:         ICVPMinVaccineDetails
Parent:          $DVCMinVaccineDetails
Title:           "ICVP HCERT Payload"
Description:     "Minimal vaccine detail in DVC payload for use within an HCERT Payload using the ICVP Product Catalogue"
* ^status = #active
* ^version = "1"
* ^abstract = false
* ^purpose = "Satisfies the Section 2 (Vaccine or Prophylaxis) requirements captured in Requirements/ICVPRequirements. Derived/collapsed Annex 6 columns (disease name, manufacturer, coded batch) are resolved per REQ-DE-12, REQ-DE-16 and REQ-DE-18/19."

// REQ-DE-11 · ICVP.C5.DE.11 — Vaccine or prophylaxis product (1..1, code, required binding).
// REQ-CC-06 — Only WHO-approved products are valid.
* vp from ICVPProductIds (required)
* vp ^requirements = "Satisfies REQ-DE-11 (ICVP.C5.DE.11) and REQ-CC-06. SHALL carry the identifier of the vaccine/prophylaxis product administered. Bound (required) to ICVPProductIds — a product outside this catalogue SHALL be rejected by ICVP.DT.1 / ICVP.DT.2. Disease (REQ-DE-12) and manufacturer (REQ-DE-16) are DERIVED from vp via the ICVP Product Catalogue and are NOT independently populated."
* vp ^comment = "LOINC 39236-5; SNOMED CT 787859002."

// REQ-DE-13 · ICVP.C5.DE.13 — Date of vaccination (1..1, date). Field is named `dv` on DVCMinVaccineDetails.
* dv ^requirements = "Satisfies REQ-DE-13 (ICVP.C5.DE.13). SHALL be the calendar date on which the vaccine/prophylaxis was administered — the anchor for all temporal-validity calculations (REQ-DE-20, REQ-DE-21/22/23). SHALL NOT be later than the certificate's issuance date or the verification date; MAY precede the issuance date."
* dv ^comment = "LOINC 30952-6."

// REQ-DE-14 · ICVP.C5.DE.14 — Supervising clinician name (0..1, string, conditional).
* cn ^requirements = "Satisfies REQ-DE-14 (ICVP.C5.DE.14) and contributes to REQ-CC-07. MAY carry the full name of the supervising clinician. Either cn or is (REQ-DE-15) SHALL be present — see invariant must-have-issuer-or-clinician-name on DVCMinVaccineDetails. This is the digital counterpart of the Annex 6 clinician name column, NOT of the wet-ink signature (REQ-CC-08)."

// REQ-DE-15 · ICVP.C5.DE.15 — Issuing authority (0..1, id, conditional, GDHCN-bound).
* is ^requirements = "Satisfies REQ-DE-15 (ICVP.C5.DE.15) and contributes to REQ-CC-07 / REQ-CC-10. MAY carry the identifier of the relevant issuing authority; SHALL correspond to a participant in the GDHCN SMART Trust ValueSet-Participants. Either cn (REQ-DE-14) or is SHALL be present. Certificates intended for international border verification SHOULD populate is — without it, cryptographic verification through the GDHCN is not possible."

// REQ-DE-17 · ICVP.C5.DE.17 — Batch number (1..1, string, required).
// Collapses ICVP.C5.DE.18 (string) and ICVP.C5.DE.19 (coded) — see REQ-DE-18/19.
* bo ^requirements = "Satisfies REQ-DE-17 (ICVP.C5.DE.17) and absorbs REQ-DE-18 (DE.18) and REQ-DE-19 (DE.19). SHALL carry the batch (lot) number as recorded by the manufacturer. Where a coded catalogue of batches is available, populate bo with the manufacturer's canonical batch identifier to preserve recall and pharmacovigilance traceability. SHALL NOT be omitted (Coexistence footnote 28)."
* bo ^comment = "LOINC 30959-1 'Lot number [Identifier] Vaccine'."

