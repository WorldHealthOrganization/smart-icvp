# Business Processes - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Business Requirements**](business-requirements.md)
* **Business Processes**

## Business Processes

This page describes the business processes included in the WHO Specifications and Standards for Digital ICVP.

A business process is a set of related activities or tasks performed together to achieve the objectives of the health programme area, such as registration, counselling and referrals. Workflows are a visual representation of the progression of activities (tasks, events, interactions) that are performed within the business process. The workflow provides a "story" for the business process being diagrammed and is used to enhance communication and collaboration among users, stakeholders and engineers.

This section describes the key business processes involved in the issuance and ascertainment of validity and authenticity of a digital ICVP. These processes reflect interactions between the different personas involved in digital ICVP issuance and ascertainment of validity and authenticity.

### Overview of Key Business Processes

**Table 5. Overview of key business processes**

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| A | Register traveller | ICVP.A | Vaccination provider / issuing authority | To create, retrieve or update a traveller record and link vaccination events to support ICVP issuance. | Start condition: Traveller seeks an ICVP for international travelGather traveller detailsSearch for existing traveller recordVerify traveller identityConfirm existing record or create new traveller recordValidate and update traveller details |
| B | Administer vaccine and/or prophylaxis | ICVP.B | Vaccination provider / issuing authority | To assess eligibility for vaccination, safely administer required vaccine(s) and monitor for adverse events. | Start condition: Traveller requires vaccination for international travelAssess contraindications and determine eligibilityCounsel traveller and obtain consentPrepare and administer vaccineDispose of wasteMonitor for adverse eventsDetermine follow-up |
| C | Enter vaccination data in EIR | ICVP.C | Vaccination provider / issuing authority | To review vaccination information from existing records, assess whether it meets ICVP requirements and record vaccination data in the EIR to support ICVP issuance. | Start condition: Vaccination administered or traveller presents existing vaccination recordReview vaccination recordDetermine whether vaccination record meets ICVP requirementsEnter vaccination data into EIR |
| D | Generate digital ICVP | ICVP.D | Certificate generation service | To generate and digitally sign an ICVP using validated vaccination data and make it available to the traveller. | Start condition: Request for digital ICVP issuance receivedValidate vaccination data completenessDetermine whether required data elements are availableGenerate digital ICVPApply cryptographic signatureReturn signed digital ICVP to the requesting digital serviceMake digital ICVP available |
| E | Digital ascertainment of validity and authenticity of digital ICVP | ICVP.E | Border health inspectorStatus checking applicationPublic health authority | To ascertain the validity and authenticity of a digital ICVP presented by a traveller by validating the certificate data and verifying the cryptographic signature using digital means. | Start condition: Traveller presents digital ICVP at point of entryScan QR code using status checking applicationCheck authenticity of the ICVPCheck completeness of ICVP dataCheck vaccination validityAccept digital ICVP or take action in accordance with IHR and national procedures |
| F | Non-digital ascertainment of validity and authenticity of digital ICVP | ICVP.F | Border health inspectorPublic health authority | To ascertain the validity and authenticity of a digital ICVP through visual inspection and, where necessary, confirmation from the issuing State Party when automated verification through QR code scanning is not available or inconclusive. | Start condition: Traveller presents digital ICVP and digital verification tools are unavailableVisually assess authenticity based on document and issuing authorityIf needed, request ascertainment of authenticity from issuing State PartyCheck completeness of ICVP dataCheck vaccination validityAccept digital ICVP or take action in accordance with IHR and national procedures |

### Workflows

The workflows that follow depict processes that have been generalized across different contexts and may not reflect the variability and nuances across different settings. The simplicity of the workflow may not adequately illustrate the nonlinear steps that may occur.

#### Overview of key digital ICVP processes

#### A. Register traveller

**Objective:** To correctly locate, identify, update or create a traveller record in the health information system to maintain accurate traveller information and vaccination documentation. This record will be used as the foundation for ICVP issuance.

#### B. Administer vaccine and/or prophylaxis

**Objective:** To assess eligibility for vaccination, safely administer required vaccine(s) and monitor for adverse events.

#### C. Enter vaccination data in EIR

**Objective:** To review vaccination information from existing records, assess whether it meets ICVP requirements and record vaccination data in the EIR to support ICVP issuance.

#### D. Generate digital ICVP

**Objective:** To generate and digitally sign an ICVP using validated vaccination data and make it available to the traveller.

#### E. Digital ascertainment of validity and authenticity of digital ICVP

**Objective:** To ascertain the validity and authenticity of a digital International Certificate of Vaccination or Prophylaxis (ICVP) presented by a traveller by validating the certificate data and verifying the cryptographic signature using digital means.

#### F. Non-digital ascertainment of validity and authenticity of digital ICVP

**Objective:** To ascertain the validity and authenticity of a digital International Certificate of Vaccination or Prophylaxis (ICVP) through visual inspection of the certificate and, where necessary, confirmation from the issuing State Party when automated verification through QR code scanning is not available or inconclusive.

