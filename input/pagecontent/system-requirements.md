### Functional Requirements
{% include functional-requirements.md %}


### Non-functional Requirements
{% include non-functional-requirements.md %}
# Requirements: Core Data Elements for the Digital ICVP

This page captures the **regulatory and normative requirements** governing each core data element of the Digital International Certificate of Vaccination or Prophylaxis (Digital ICVP). It is the normative source for the FHIR logical models, profiles, value sets and conformance rules defined in this Implementation Guide.

## Sources

Requirements are derived from:

- **IHR (2005), as amended in 2014, 2022 and 2024** — in particular **Annex 6  (Vaccination, prophylaxis and related certificates)** and **Annex 7  (Requirements concerning vaccination or prophylaxis for specific diseases)**.   The amended Model ICVP entered into force on **19 September 2025** and  applies to certificates issued on or after that date.
- **WHO Guidance on the issuance and ascertainment of validity and authenticity of the ICVP, both in non-digital and digital format** ("the Coexistence document"), in particular **Table 2 — Data dictionary related to the amended Model ICVP in Annex 6**.
- **WHO Specifications and standards for the Digital ICVP** ("the Specifications document"), in particular **Component 3 — Scenarios**,
  **Component 5 — Core data elements** and the **Core Data Dictionary** implementation tool.

## Normative logical model

The normative logical model for the Digital ICVP payload (QR Code) in this IG is [**`ICVPMin`**](/ICVPMin.html). `ICVPMin` uses short-form field names optimised for the HCERT payload and binds the vaccine product identifier to the ICVP Product Catalogue (`ICVPProductIds`). Every requirement in this document is traced both to its regulatory source
and to the corresponding `ICVPMin` / `DVCMin` element.

Conformance keywords (**SHALL**, **SHOULD**, **MAY**) follow [RFC 2119](https://www.rfc-editor.org/rfc/rfc2119).


## 1. Scope and Cross-Cutting Requirements

The following requirements derived from **Annex 6 paragraphs 2–7** apply to **every** Digital ICVP and therefore constrain the IG as a whole.

### REQ-CC-01 — No departure from the Model

The Digital ICVP **SHALL** conform to the Model ICVP specified in Annex 6. *No departure shall be made from the model of the certificate specified in this Annex* (Annex 6, paragraph 2). Implementations **SHALL NOT** add, remove or rename core data elements; they **MAY** extend the dictionary with additional local elements only where this does not displace or contradict any required element.

The Coexistence document (`260306`) clarifies that *"the layout and the colour (of the paper or digital background) of the ICVP do not affect the validity of an ICVP"*. Implementations therefore have latitude in visual presentation (styling, branding, human-readable arrangement) provided the required data elements are present and accurately represented.

### REQ-CC-02 — Three logical sections

The amended Model ICVP comprises three sections that are integral to any ICVP regardless of format (Coexistence document). A Digital ICVP **SHALL** represent all three:

1. Information about the recipient — `ICVPMin.n`, `dob`, `s`, `nt`, `id`, `dt`, `gn` (ICVP.A9.DE.1 – A9.DE.10);
2. List of vaccine(s) or prophylaxis(es) administered — `ICVPMin.vx` (`ICVPMinVaccineDetails`, ICVP.C5.DE.11 – C5.DE.19);
3. Basic information to ascertain the validity of the certificate — `ICVPMin.v` and the HCERT envelope fields (ICVP.D5.DE.20 – D5.DE.27).

### REQ-CC-03 — Individuality of the certificate

*Certificates are individual and shall in no circumstances be used collectively. Separate certificates shall be issued for children* (Annex 6, paragraph 7). A Digital ICVP instance **SHALL** describe exactly one recipient. Bundling multiple recipients in a single signed payload is **NOT PERMITTED**.

The Coexistence document (`260306`) further specifies that *"each unique QR code generated represents only a single administration of a vaccination or prophylaxis"*. Therefore each signed `ICVPMin` payload **SHALL** correspond to exactly one administered dose of one vaccine or prophylaxis product; a recipient who has received multiple vaccinations (e.g. yellow fever plus poliovirus) **SHALL** be issued one Digital ICVP per administration.

### REQ-CC-04 — Language of completion

*Certificates shall be fully completed in English or in French. They may also be completed in another language, in addition to either English or French* (Annex 6, paragraph 5). All required string-typed fields (e.g. `ICVPMin.n`, `gn`, vaccine details) **SHALL** be present in **English or French**. Implementations **MAY** carry parallel translations in additional languages; translations **SHALL NOT** replace the English or French representation.

### REQ-CC-05 — No amendment or erasure

*Any amendment of this certificate, or erasure, or failure to complete any part of it, may render it invalid* (Annex 6, paragraph 6). For digital implementations, this is enforced through the **cryptographic integrity check** on the HCERT payload. Once signed, the payload **SHALL NOT** be modified. Any required correction **SHALL** be issued as a new certificate.

### REQ-CC-06 — WHO-approved vaccine or prophylaxis

*Certificates under this Annex are valid only if the vaccine or prophylaxis used has been approved by WHO* (Annex 6, paragraph 3). The product recorded in `ICVPMinVaccineDetails.vp` **SHALL** be drawn from the **ICVP Product Catalogue** (`ICVPProductIds`), which is itself derived from:

- the WHO List of Prequalified Vaccines;
- the WHO Emergency Use Listing (EUL) procedure;
- the WHO Prequalified Finished Pharmaceutical Products list.

A certificate referencing a product not on this catalogue **SHALL** be deemed invalid by the validity-ascertainment logic (decision-support tables ICVP.DT.1 and ICVP.DT.2).

### REQ-CC-07 — Naming of the issuer

*Regardless of the format in which they have been issued, certificates must bear the name of the clinician supervising the administration of the vaccine or prophylaxis, or of the relevant authority responsible for issuing the certificate or overseeing the administering centre* (Annex 6, paragraph 4). In the minimal payload this is enforced by the invariant `must-have-issuer-or-clinician-name` on `DVCMinVaccineDetails`, which requires at least one of `cn` (supervising clinician name) or `is` (issuer identifier) to be present.

### REQ-CC-08 — Wet-ink artefacts not applicable

The Coexistence document (Table 2) clarifies that recipient signature, guardian signature, clinician signature and official centre stamp apply **only** to non-digital format and **SHALL NOT** be carried in the Digital ICVP payload. These are replaced by the HCERT cryptographic signature.

### REQ-CC-09 — Applicability

*The amendments to the Model ICVP only apply to certificates issued after 19 September 2025* (Coexistence document, citing op. paragraph 2.(2) of WHA77.17). The Digital ICVP profiled in this IG **SHALL** be used only for certificates issued on or after that date, and only for State Parties for which the 2024 amendments are in force.

### REQ-CC-10 — Verifiability

A Digital ICVP **SHALL** be **verifiable** — meaning that its integrity and authenticity can be cryptographically validated by any party in possession of the QR code payload and access to the GDHCN trust list, without recourse to the issuer. The Coexistence document (`260306`) defines *"verifiable"* in the context of an ICVP in digital format as *"the ability for information on an ICVP that can be cryptographically validated to confirm both integrity and authenticity"*.

Verifiability is operationalised jointly by REQ-DE-25 (cryptographic signature), REQ-DE-26 (key identifier for signature verification), REQ-DE-15 (issuing authority bound to the GDHCN `ValueSet-Participants`) and REQ-CC-05 (no post-signature modification).

### REQ-CC-11 — Selective disclosure

The Digital ICVP **SHOULD** support **selective disclosure**, defined by the Coexistence document (`260306`) as *"a feature of the ICVP in digital format that enables the traveller to display only the relevant QR code or specific data required for inspection, without disclosing additional or unrelated information"*.

This IG realises selective disclosure via the [`ICVPSD`](ICVPSD.html) profile, which attaches the `SelectiveDisclosure` extension to each recipient and vaccine-detail field of `ICVP`. Issuers issuing through a traveller-facing application (e.g. a traveller portal or an electronic device with a user interface) **SHOULD** use `ICVPSD` so that the recipient can choose to disclose, for example, only vaccine and validity data without revealing full demographics. Issuers whose delivery channel is a single printed QR code on paper or card **MAY** use the plain `ICVPMin` profile, recognising that selective disclosure is not meaningful in that medium.

Selective disclosure **SHALL NOT** be used to omit data elements that are designated *Required* by Table 2 of the Coexistence document at issuance time; it governs only what is displayed to an inspecting party at verification time.

---

## 2. Section 1 — Information about the Recipient

### REQ-DE-01 — Name of the recipient (ICVP.A9.DE.1 → `ICVPMin.n`)

| Property | Value |
|---|---|
| `ICVPMin` field | `n` |
| FHIR data type | `string` |
| Cardinality | `1..1` |
| Optionality | **Required** |
| Coding | ICVP.Core #ICVP.A9.DE.1; LOINC 87226-7 "Legal name of patient - first and last" |
| Source | Annex 6 Model ICVP; Coexistence Table 2; `DVCMin.fsh` |

The Digital ICVP **SHALL** carry the **full name** of the recipient of the vaccine or prophylaxis, transcribed usually from the identity document the recipient intends to use for travel. The recipient is the natural person who actually received the vaccine ("subject"); per the Specifications glossary, this may differ from the holder of the certificate (e.g. a parent presenting a child's ICVP).

The IHR places no constraint on cultural ordering of name parts, on transliteration, or on the use of diacritics. Because the field is a single `string` in `ICVPMin`, the issuer **SHALL** record the name in the **same form and order as it appears in the name field of the identity document** used for travel.

### REQ-DE-02 — Date of birth (ICVP.A9.DE.2 → `ICVPMin.dob`)

| Property | Value |
|---|---|
| `ICVPMin` field | `dob` |
| FHIR data type | `date` |
| Cardinality | `1..1` |
| Optionality | **Required** |
| Coding | ICVP.Core #ICVP.A9.DE.2; LOINC 21112-8; SNOMED CT 184099003 |
| Source | Annex 6 Model ICVP; Coexistence Table 2; `DVCMin.fsh` |

The recipient's date of birth **SHALL** be recorded as a fully specified calendar date. Where the identity document shows a partial date (e.g. only a year), the issuer **SHOULD** apply national policy to complete the field; this is an edge case to be handled through State Party configuration and is not resolved by the IG.

### REQ-DE-03 — Sex (ICVP.A9.DE.3 → `ICVPMin.s`)

| Property | Value |
|---|---|
| `ICVPMin` field | `s` |
| FHIR data type | `code` |
| Cardinality | `1..1` |
| Optionality | **Required** |
| Binding | `$GENDER` (HL7 FHIR `AdministrativeGender`) — extensible |
| Coding | ICVP.Core #ICVP.A9.DE.3 |
| Permissible values | ICVP.A9.DE.4 Male · DE.5 Female · DE.6 Other · DE.7 Unknown |
| Source | Annex 6 Model ICVP; Coexistence Table 2; Core Data Dictionary; `DVCMin.fsh` |

The Digital ICVP **SHALL** record the sex of the recipient. Annex 6 lists "sex" as a free-text slot and does **not** prescribe a coded value set; the Core Data Dictionary, however, supplies four permissible values for Digital ICVP. The IG binds this element to FHIR `AdministrativeGender` (`male` / `female` / `other` /`unknown`) via the mappings defined in the ICVP.Core ConceptMap.

Usually, the value corresponds to the sex indicated on the recipient's identity document used for travel. If the identity document records a value that does not map directly onto Male or Female (for example "X" as used on some passports), then implementations **MAY** either extend the valueset, or map it to one of the permissible values. Note, for interoperability purposes, extended values that are not in the core valueset **SHALL** be mapped to **"unknown"** (ICVP.A9.DE.7).

### REQ-DE-08 — Nationality (ICVP.A9.DE.8 → `ICVPMin.nt`)

| Property | Value |
|---|---|
| `ICVPMin` field | `nt` |
| FHIR data type | `code` |
| Cardinality | `1..1` |
| Optionality | **Required** |
| Binding | `$countryVS` — extensible |
| Coding | ICVP.Core #ICVP.A9.DE.8; LOINC 69433-1 "Citizenship status"; SNOMED CT 223369002 "Country (geographic location)" |
| Source | Annex 6 Model ICVP; Coexistence Table 2; `DVCMin.fsh` |

The Digital ICVP **SHALL** record the **nationality** of the recipient. The IHR Model ICVP does not prescribe a coded representation; the IG requires an **ISO 3166-1** country code for interoperability across border-control systems. The existing IG dictionary narrative binds this to three-letter (alpha-3) ISO 3166-1 codes.

`ICVPMin.nt` is **cardinality `1..1`** — the minimal payload records a **single** nationality usually the one as per the recipient's identity document.

Cases where nationality cannot be established (e.g. stateless persons) **SHOULD** be handled in accordance with national policy, recognising that this element is designated *Required* by both Annex 6 and the Core Data Dictionary.


### REQ-DE-09 — National identification document (ICVP.A9.DE.9 → `ICVPMin.id` + `ICVPMin.dt`)

| Property | Value |
|---|---|
| `ICVPMin` fields | `id` (document number), `dt` (document type) |
| FHIR data types | `id` : `string` · `dt` : `code` |
| Cardinality | `id` : `0..1` · `dt` : `0..1` |
| Optionality | **Optional / If applicable** |
| Bindings | `dt` from `$identifierTypeVS` — extensible |
| Coding | ICVP.Core #ICVP.A9.DE.9; LOINC 76435-7 "Patient identifier" |
| Source | Annex 6 Model ICVP ("national identification document, if applicable"); Coexistence Table 2; Coexistence footnote 23; Coexistence section *Validity of the ICVP and its ascertainment* ("Individual issuance"); `DVCMin.fsh` |

The Digital ICVP **MAY** carry an identifier from an official national identity document (e.g. national ID card, passport). Inclusion is governed by the policy of the issuing State Party.

The Coexistence document now expressly endorses the use of this element for identity binding at border control: under the "Individual issuance" validity criterion, the method for ascertaining validity is stated as *"inspection of the ICVP vis-à-vis the 'national identification document, if applicable' (amended Model ICVP) or other personal identification document"*. Issuers **SHOULD** therefore populate this element wherever operationally feasible, typically with the passport or equivalent travel identity document.

The Coexistence document notes (footnote 23) that *the Model ICVP does not specify whether the data element "National identification document, if applicable" refers to the type or number of the identification document or to both*. To remove this ambiguity, the IG **SHALL** support both:
- **`id`** (0..1, `string`) — the **document number** (e.g. the passport
  number);
- **`dt`** (0..1, `code`) — the **document type**, bound to the HL7 v2
  identifier-type value set (`$identifierTypeVS`).

Implementations **SHOULD** populate both where available, and **SHALL** ensure that any identifier carried complies with the data-protection regime of the issuing State Party (Article 45 IHR — Treatment of personal data).


### REQ-DE-10 — Name of the parent or guardian (ICVP.A9.DE.10 → `ICVPMin.gn`)

| Property | Value |
|---|---|
| `ICVPMin` field | `gn` |
| FHIR data type | `string` |
| Cardinality | `0..1` |
| Optionality | **Required, if applicable** (Conditional) |
| Coding | ICVP.Core #ICVP.A9.DE.10; LOINC 79183-0 "First name of Guardian or legally authorized representative"; SNOMED CT 394619001 |
| Source | Annex 6 Model ICVP; Coexistence Table 2; Core Data Dictionary; `DVCMin.fsh` |

The Digital ICVP **SHALL** carry the full name of the parent or guardian **when applicable** — that is, when the recipient is a minor or a dependent, as defined by the policy of the issuing State Party (Core Data Dictionary conditionality). Where applicable, `gn` **SHALL** be present; otherwise it **SHALL** be omitted.

Where the parent or guardian holds their own travel identity document, the issuer **SHOULD** record the name as it appears on that document, to facilitate border-control identity binding when a guardian presents the child's ICVP.

The wet-ink *signature of a parent or guardian* required by Annex 6 for non-digital ICVPs is **not applicable** in the digital format.

---
## 3. Section 2 — Vaccine or Prophylaxis Administered

All elements in this section map to fields of `ICVPMinVaccineDetails`, which derives from `DVCMinVaccineDetails`. The container element on the parent payload is `ICVPMin.vx` (cardinality `1..1`, type `ICVPMinVaccineDetails`). 

The minimal payload deliberately collapses some Annex 6 columns: the **name of disease or condition** (ICVP.C5.DE.12) and the **manufacturer** (ICVP.C5.DE.16) are **not carried as independent fields** in `ICVPMinVaccineDetails` — they are derived at verification time from the selected vaccine product (`vp`) by lookup against the ICVP Product Catalogue. This reflects the implementation note in the user scenarios (*"Based on the vaccine or prophylaxis product entered, the EIR automatically derives and populates related data elements, such as the name of disease and manufacturer"*) and aligns with Coexistence document footnotes 25–27, which explicitly anchor disease, vaccine and manufacturer to the WHO PQ / EUL / Finished Pharmaceutical Products lists.

### REQ-DE-11 — Vaccine or prophylaxis (ICVP.C5.DE.11 → `ICVPMinVaccineDetails.vp`)

| Property | Value |
|---|---|
| Field | `vp` |
| FHIR data type | `code` |
| Cardinality | `1..1` |
| Optionality | **Required** |
| Binding | `ICVPProductIds` — **required** |
| Coding | ICVP.Core #ICVP.C5.DE.11; LOINC 39236-5 "Vaccine code"; SNOMED CT 787859002 "Vaccine product (medicinal product)" |
| Source | Annex 6 Model ICVP; Annex 6 paragraph 3 (WHO approval); Coexistence Table 2 and footnotes 25–27; `DVCMinVaccineDetails.fsh`; `ICVPMin.fsh` |

The Digital ICVP **SHALL** carry the identifier of the vaccine or prophylaxis product administered. Per Annex 6 paragraph 3 — *Certificates under this Annex are valid only if the vaccine or prophylaxis used has been approved by WHO* — `vp` is bound with strength **required** to the `ICVPProductIds` value set, which is the curated ICVP Product Catalogue derived from:

- the WHO List of Prequalified Vaccines;
- the WHO Emergency Use Listing (EUL) procedure;
- the WHO Prequalified Finished Pharmaceutical Products list.

A certificate carrying a value outside `ICVPProductIds` **SHALL** be rejected as invalid by decision-support tables ICVP.DT.1 (yellow fever) and ICVP.DT.2 (poliovirus) and any future disease-specific tables added under Annex 7. 

The **name of disease or condition** (ICVP.C5.DE.12) is **not** a separately populated field in the minimal payload; verifiers **SHALL** derive it deterministically from `vp` via the ICVP Product Catalogue. Likewise the **manufacturer** (ICVP.C5.DE.16) is derived from `vp` and is **not** independently populated.

### REQ-DE-13 — Date of vaccination (ICVP.C5.DE.13 → `ICVPMinVaccineDetails.dt`)

| Property | Value |
|---|---|
| Field | `dt` |
| FHIR data type | `date` |
| Cardinality | `1..1` |
| Optionality | **Required** |
| Coding | ICVP.Core #ICVP.C5.DE.13; LOINC 30952-6 "Date and time of vaccination" |
| Source | Annex 6 Model ICVP; `DVCMinVaccineDetails.fsh` |

The Digital ICVP **SHALL** carry the **date on which the vaccine or prophylaxis was administered**, as a full calendar date. This date is the anchor for all temporal-validity calculations (see REQ-DE-20, REQ-DE-23). 

The administration date **SHALL NOT** be later than the certificate's issuance date and **SHALL NOT** be later than the date the certificate is presented for verification. The administration date **MAY** precede the issuance date.


### REQ-DE-14 — Name of supervising clinician (ICVP.C5.DE.14 → `ICVPMinVaccineDetails.cn`)

| Property | Value |
|---|---|
| Field | `cn` |
| FHIR data type | `string` |
| Cardinality | `0..1` |
| Optionality | **Conditional** — see invariant below |
| Coding | ICVP.Core #ICVP.C5.DE.14 |
| Source | Annex 6 paragraph 4; Annex 6 Model ICVP; Coexistence Table 2; Core Data Dictionary; `DVCMinVaccineDetails.fsh` |

The Digital ICVP **MAY** carry the full name of the medical practitioner or other authorised health worker who supervised the administration of the vaccine or prophylaxis. This field is the digital counterpart of the "Name of supervising clinician" column in the Annex 6 Model table — but **not** of the wet-ink signature, which is not applicable in the digital format (REQ-CC-08).

Either `cn` (this field) or `is` (REQ-DE-15) **SHALL** be present — see REQ-CC-07 and the invariant `must-have-issuer-or-clinician-name` defined on `DVCMinVaccineDetails`.

### REQ-DE-15 — Issuing authority (ICVP.C5.DE.15 → `ICVPMinVaccineDetails.is`)

| Property | Value |
|---|---|
| Field | `is` |
| FHIR data type | `id` |
| Cardinality | `0..1` |
| Optionality | **Conditional** — see invariant below |
| Binding | Must reference a participant in the GDHCN (SMART Trust) ValueSet for Participants |
| Coding | ICVP.Core #ICVP.C5.DE.15 |
| Source | Annex 6 paragraph 4; Coexistence Table 2; Core Data Dictionary (validation condition); `DVCMinVaccineDetails.fsh` |

The Digital ICVP **MAY** carry the identifier of the **relevant authority responsible for issuing the certificate** or for overseeing the administering centre. Per the Core Data Dictionary, this identifier **SHALL** correspond to a participant onboarded to the **WHO Global Digital Health Certification Network (GDHCN)** trust framework, as expressed in the SMART Trust `ValueSet-Participants`. This binding is what makes cryptographic verification possible at the border: the issuer's public key must be discoverable through the GDHCN trust list.  Either `cn` (REQ-DE-14) or `is` (this field) **SHALL** be present, by the invariant `must-have-issuer-or-clinician-name` on `DVCMinVaccineDetails`. In practice, certificates intended for international border verification **SHOULD** populate `is` — without it, the certificate cannot be cryptographically verified through the GDHCN.

### REQ-DE-17 — Batch number (ICVP.C5.DE.17 → `ICVPMinVaccineDetails.bo`)

| Property | Value |
|---|---|
| Field | `bo` |
| FHIR data type | `string` |
| Cardinality | `1..1` |
| Optionality | **Required** |
| Coding | ICVP.Core #ICVP.C5.DE.17; LOINC 30959-1 "Lot number [Identifier] Vaccine" |
| Source | Annex 6 Model ICVP ("Manufacturer and batch No."); Coexistence Table 2 (Required[^27],[^28]); Coexistence footnote 27 (manufacturer derived from WHO PQ/EUL); Coexistence footnote 28 ("The 'batch No. [number]' is required"); `DVCMinVaccineDetails.fsh` |

The Digital ICVP **SHALL** carry the **batch (lot) number** of the vaccine or prophylaxis administered, as recorded by the manufacturer.

The Core Data Dictionary defines two representations for batch (DE.18 as free-text string; DE.19 as a coded value drawn from a predefined batch list). The minimal payload `ICVPMinVaccineDetails.bo` collapses these into a **single string field** for HCERT compactness; where a coded catalogue of batches is available, the issuer **SHOULD** still populate `bo` with the manufacturer's canonical batch identifier so that recall and pharmacovigilance lookups remain possible. 

The Coexistence document is unambiguous on this point in footnote 28: *"The 'batch No. [number]' is required."* `bo` **SHALL NOT** be omitted, even where national policy might otherwise treat batch as administrative metadata.

The new Coexistence document (`260306`) also separates the manufacturer and batch footnotes on the "Manufacturer and batch No." row (cited as `Required[^27],[^28]`): footnote 27 confirms that the manufacturer is derived from the WHO PQ / EUL / Finished Pharmaceutical Products lists (and is therefore not independently populated in the minimal payload — see REQ-DE-16), while footnote 28 imposes the explicit batch requirement captured by this field.

### REQ-DE-12, REQ-DE-16, REQ-DE-18, REQ-DE-19 — Derived or collapsed elements

The following Annex 6 / Core Data Dictionary elements are **not**
independently populated in `ICVPMinVaccineDetails`:

| Data element | Disposition |
|---|---|
| ICVP.C5.DE.12 — Name of disease or condition | **Derived** at verification time from `vp` via the ICVP Product Catalogue. The Core Data Dictionary validation rule (*"Must correspond to the disease targeted by the selected vaccine or prophylaxis product"*) makes this derivation deterministic. |
| ICVP.C5.DE.16 — Manufacturer of vaccine or prophylaxis | **Derived** at verification time from `vp` via the ICVP Product Catalogue (Coexistence footnote 27). |
| ICVP.C5.DE.18 — Batch number (string) | **Collapsed** into `bo` (REQ-DE-17). |
| ICVP.C5.DE.19 — Batch number (coded) | **Collapsed** into `bo` (REQ-DE-17); coded representations are out of scope for the minimal HCERT payload. |

Verifier implementations **SHALL** be able to resolve `vp` to the corresponding disease and manufacturer using the published ICVP Product Catalogue at verification time. Issuer implementations **MAY** still display these derived fields to the recipient on the human-readable view of the certificate, but **SHALL NOT** carry them in the signed payload.

---

## 4. Section 3 — Basic Information to Ascertain Validity

This section corresponds to ICVP.D5.DE.20 – ICVP.D5.DE.27 of the Core Data Dictionary. In `ICVPMin`, **only the version identifier (`v`) is carried as a payload field**. The remaining elements — the validity period, the cryptographic signature and the key identifier — are **properties of the HCERT envelope** that wraps the `ICVPMin` payload, not of `ICVPMin` itself. Requirements in this section therefore split into two groups: payload-level (REQ-DE-27) and envelope-level (REQ-DE-20/23, REQ-DE-25/26).

### REQ-DE-20 — Certificate valid from (ICVP.D5.DE.20)

| Property | Value |
|---|---|
| Carried in | HCERT envelope (issued-at / not-before claim) |
| FHIR data type | `date` |
| Cardinality | `1..1` |
| Optionality | **Required** |
| Coding | ICVP.Core #ICVP.D5.DE.20 |
| Source | Annex 6 Model ICVP ("Certificate valid from … until …"); Coexistence Table 2; Coexistence footnote 30 |

The Digital ICVP **SHALL** carry a **"valid from" date**. Per Coexistence footnote 30, this date is **calculated** from the date of administration (`ICVPMinVaccineDetails.dt`, REQ-DE-13) according to disease-specific rules. For yellow fever, Annex 7 paragraph 2.(a).(iv) sets the offset at **ten days after the date of vaccination**:

> *"the validity of a certificate of vaccination against yellow fever
> shall extend for the life of the person vaccinated, beginning 10 days
> after the date of vaccination."*

Issuer implementations **SHALL** compute the "valid from" date deterministically from `dt` using the disease-specific rule embedded in decision-support tables ICVP.DT.1 (yellow fever) and ICVP.DT.2 (poliovirus). The certificate **SHALL NOT** be presented to the verifier as valid before this date; per Annex 7 paragraph 2.(c), a traveller in possession of a not-yet-valid yellow-fever certificate may be permitted to depart but may be subject to the provisions of Annex 7 paragraph 2.(h) on arrival.

### REQ-DE-21, REQ-DE-22, REQ-DE-23 — Certificate valid until (ICVP.D5.DE.21–23)

| Property | Value |
|---|---|
| Carried in | HCERT envelope (expires-at claim, with disease-specific encoding) |
| FHIR data type | `string` (lifetime) **or** `date` (bounded) |
| Cardinality | `1..1` |
| Optionality | **Required** |
| Coding | ICVP.Core #ICVP.D5.DE.21 (selector); DE.22 (string variant); DE.23 (date variant) |
| Source | Annex 6 Model ICVP; Annex 7 paragraph 2.(a).(iii)–(iv); Coexistence Table 2 and footnote 29 |

The Digital ICVP **SHALL** carry a **"valid until" value** for each vaccine or prophylaxis recorded. The Core Data Dictionary models this as a discriminated union with two variants:

- **Lifetime validity** (DE.22, `string`) — used when the vaccine confers lifelong protection. Per Coexistence footnote 29 and Annex 7
  paragraph 2.(a).(iii), one full dose of yellow-fever vaccine confers lifelong protection; the value **SHALL** be encoded as the literal string
  **`"life of person vaccinated"`** (English) or **`"vie entière du sujet vacciné"`** (French), in conformance with REQ-CC-04. No other free-text values are permitted.
- **Bounded validity** (DE.23, `date`) — used for vaccines whose protection is time-limited. The value **SHALL** be a full calendar date computed from `dt` according to the disease-specific rule.

Per Coexistence footnote 30, the "valid until" date **SHALL** be computed by the issuer from the administration date and the applicable disease-specific rule; it **SHALL NOT** be entered manually in a way that contradicts the rule. The certificate **SHALL** be deemed invalid by the verifier on or after the day following this date, except where the lifetime variant is in use.

### REQ-DE-24 — Standard text following the Annex 6 table (ICVP.D5.DE.24)

| Property | Value |
|---|---|
| Carried in | Human-readable view of the certificate (presentation layer) |
| FHIR data type | `string` (fixed) |
| Cardinality | `1..1` |
| Optionality | **Required** |
| Coding | ICVP.Core #ICVP.D5.DE.24 |
| Source | Annex 6 Model ICVP (text following the table); Coexistence Table 2 |

Annex 6 prescribes the literal text that **SHALL** appear following the vaccine table on every Model ICVP, regardless of format. The Digital ICVP **SHALL** display this text on its human-readable view, in English or French (REQ-CC-04). The wording is fixed by Annex 6 and **SHALL NOT** be paraphrased; in particular it includes the WHO-approval qualifier, the rules on amendment and erasure, and the language-of-completion rule.

Because this text is invariant across all Digital ICVPs and is fully determined by the Model ICVP, it is **not carried as a payload field in `ICVPMin`** — it is rendered by the verifier or the human-readable viewer from a static template keyed off the certificate `Version` (REQ-DE-27). Implementations **SHALL** keep the text in their presentation layer synchronised with the version of Annex 6 to which the certificate conforms.

### REQ-DE-25 — Cryptographic signature of the issuer (ICVP.D5.DE.25)

| Property | Value |
|---|---|
| Carried in | HCERT envelope (COSE_Sign1 signature) |
| Optionality | **Required** |
| Coding | ICVP.Core #ICVP.D5.DE.25 |
| Source | Annex 6 paragraph 4–paragraph 6 (digital equivalent of wet-ink integrity controls); Coexistence Table 2 ("Integrity Check" row, footnote 32) |

The Digital ICVP **SHALL** be cryptographically signed by the issuing authority. The signature **SHALL** be applied over the canonical encoding of the `ICVPMin` payload using the WHO Global Digital Health Certification Network (GDHCN) signing conventions (COSE_Sign1 over the HCERT CBOR payload). The signature is the digital substitute for the Annex 6 wet-ink artefacts identified as not applicable in REQ-CC-08 (recipient signature, guardian signature, clinician signature, official centre stamp).

Per REQ-CC-05, once signed, the payload **SHALL NOT** be modified. Any required correction **SHALL** be issued as a new certificate.

### REQ-DE-26 — Key identifier for signature verification (ICVP.D5.DE.26)

| Property | Value |
|---|---|
| Carried in | HCERT envelope (COSE `kid` header) |
| Optionality | **Required** |
| Coding | ICVP.Core #ICVP.D5.DE.26 |
| Source | Coexistence Table 2 ("Integrity Check") |

The Digital ICVP **SHALL** carry a **key identifier** that allows the verifier to locate the issuer's public key in the GDHCN trust list. The identifier **SHALL** be resolvable to a participant in the SMART Trust `ValueSet-Participants` (cross-referenced by REQ-DE-15). Verifier implementations **SHALL** use this identifier to retrieve the public key and validate the signature; if the key cannot be resolved or is no longer trusted, the verifier **SHALL** treat the certificate as non-authentic.

### REQ-DE-27 — Version (ICVP.D5.DE.27 → `ICVPMin.v`)

| Property | Value |
|---|---|
| `ICVPMin` field | `v` |
| FHIR data type | `string` |
| Cardinality | `1..1` |
| Optionality | **Required** |
| Coding | ICVP.Core #ICVP.D5.DE.27 |
| Source | Coexistence Table 2; Coexistence footnote 33; `DVCMin.fsh` |

The Digital ICVP **SHALL** carry a **version identifier** for the certificate template, indicating the version of the Specifications document and the corresponding Model ICVP to which the certificate conforms. Per Coexistence footnote 33, this field exists *to track potential changes to the "Specifications and standards related to the issuance and ascertainment of authenticity of the international certificate of vaccination and prophylaxis in digital format"*.

Verifiers **SHALL** use `v` to:

- select the correct human-readable text template for REQ-DE-24;
- apply version-appropriate validation logic (e.g. data dictionary, decision-support tables, value sets);
- determine compatibility with the verifier's own implementation.

A certificate carrying a `v` value that the verifier does not recognise **SHOULD** be treated as ambiguous rather than rejected outright: the verifier **MAY** fall back to the latest version it supports and flag the discrepancy to the inspector for human judgement.


---

## 5. References

1. **International Health Regulations (2005), as amended in 2014, 2022 and
   2024** — Annex 6 (Vaccination, prophylaxis and related certificates) and
   Annex 7. Geneva: World Health Organization.
2. **Guidance related to the issuance and ascertainment of validity and
   authenticity of the International Certificate of Vaccination or
   Prophylaxis (ICVP), both in non-digital and digital format** — Table 2 and
   footnotes.
3. **Specifications and standards related to the issuance and ascertainment
   of validity and authenticity of the international certificate of
   vaccination and prophylaxis in digital format** — Component 3 (Scenarios,
   in particular *Issuance of a digital ICVP at the point of care when the
   traveller has no prior immunization history*) and Component 5 (Core data
   elements, Table 7).
4. **Digital ICVP Core Data Dictionary (v1, 2026-03-25)** — sheet `ICVP.Core`.
5. **ICVPMin logical model** — `input/fsh/models/ICVPMin.fsh`, parent
   `input/fsh/models/DVCMin.fsh` and vaccine-detail parent
   `input/fsh/models/DVCMinVaccineDetails.fsh`.
6. **ICVP.Core ConceptMap** — `input/fsh/conceptmaps/ICVP.Core.ConceptMap.fsh`.