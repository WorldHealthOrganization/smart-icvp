This page describes the business processes included in the WHO Specifications and Standards for Digital ICVP.

A business process is a set of related activities or tasks performed together to achieve the objectives of the health programme area, such as registration, counselling and referrals. Workflows are a visual representation of the progression of activities (tasks, events, interactions) that are performed within the business process. The workflow provides a "story" for the business process being diagrammed and is used to enhance communication and collaboration among users, stakeholders and engineers.

This section describes the key business processes involved in the issuance and ascertainment of validity and authenticity of a digital ICVP. These processes reflect interactions between the different personas involved in digital ICVP issuance and ascertainment of validity and authenticity.

### Overview of Key Business Processes

**Table 5. Overview of key business processes**

<table border="1" class="dataframe table table-striped table-bordered">
  <thead>
    <tr class="header">
      <th><strong>#</strong></th>
      <th><strong>Process Name</strong></th>
      <th><strong>Process ID</strong></th>
      <th><strong>Personas</strong></th>
      <th><strong>Objectives</strong></th>
      <th><strong>Task Set</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr class="odd">
      <td>A</td>
      <td>Register traveller</td>
      <td>ICVP.A</td>
      <td>Vaccination provider / issuing authority</td>
      <td>To create, retrieve or update a traveller record and link vaccination events to support ICVP issuance.</td>
      <td>Start condition: Traveller seeks an ICVP for international travel<br/>Gather traveller details<br/>Search for existing traveller record<br/>Verify traveller identity<br/>Confirm existing record or create new traveller record<br/>Validate and update traveller details</td>
    </tr>
    <tr class="even">
      <td>B</td>
      <td>Administer vaccine and/or prophylaxis</td>
      <td>ICVP.B</td>
      <td>Vaccination provider / issuing authority</td>
      <td>To assess eligibility for vaccination, safely administer required vaccine(s) and monitor for adverse events.</td>
      <td>Start condition: Traveller requires vaccination for international travel<br/>Assess contraindications and determine eligibility<br/>Counsel traveller and obtain consent<br/>Prepare and administer vaccine<br/>Dispose of waste<br/>Monitor for adverse events<br/>Determine follow-up</td>
    </tr>
    <tr class="odd">
      <td>C</td>
      <td>Enter vaccination data in EIR</td>
      <td>ICVP.C</td>
      <td>Vaccination provider / issuing authority</td>
      <td>To review vaccination information from existing records, assess whether it meets ICVP requirements and record vaccination data in the EIR to support ICVP issuance.</td>
      <td>Start condition: Vaccination administered or traveller presents existing vaccination record<br/>Review vaccination record<br/>Determine whether vaccination record meets ICVP requirements<br/>Enter vaccination data into EIR</td>
    </tr>
    <tr class="even">
      <td>D</td>
      <td>Generate digital ICVP</td>
      <td>ICVP.D</td>
      <td>Certificate generation service</td>
      <td>To generate and digitally sign an ICVP using validated vaccination data and make it available to the traveller.</td>
      <td>Start condition: Request for digital ICVP issuance received<br/>Validate vaccination data completeness<br/>Determine whether required data elements are available<br/>Generate digital ICVP<br/>Apply cryptographic signature<br/>Return signed digital ICVP to the requesting digital service<br/>Make digital ICVP available</td>
    </tr>
    <tr class="odd">
      <td>E</td>
      <td>Digital ascertainment of validity and authenticity of digital ICVP</td>
      <td>ICVP.E</td>
      <td>Border health inspector<br/>Status checking application<br/>Public health authority</td>
      <td>To ascertain the validity and authenticity of a digital ICVP presented by a traveller by validating the certificate data and verifying the cryptographic signature using digital means.</td>
      <td>Start condition: Traveller presents digital ICVP at point of entry<br/>Scan QR code using status checking application<br/>Check authenticity of the ICVP<br/>Check completeness of ICVP data<br/>Check vaccination validity<br/>Accept digital ICVP or take action in accordance with IHR and national procedures</td>
    </tr>
    <tr class="even">
      <td>F</td>
      <td>Non-digital ascertainment of validity and authenticity of digital ICVP</td>
      <td>ICVP.F</td>
      <td>Border health inspector<br/>Public health authority</td>
      <td>To ascertain the validity and authenticity of a digital ICVP through visual inspection and, where necessary, confirmation from the issuing State Party when automated verification through QR code scanning is not available or inconclusive.</td>
      <td>Start condition: Traveller presents digital ICVP and digital verification tools are unavailable<br/>Visually assess authenticity based on document and issuing authority<br/>If needed, request ascertainment of authenticity from issuing State Party<br/>Check completeness of ICVP data<br/>Check vaccination validity<br/>Accept digital ICVP or take action in accordance with IHR and national procedures</td>
    </tr>
  </tbody>
</table>

### Workflows

The workflows that follow depict processes that have been generalized across different contexts and may not reflect the variability and nuances across different settings. The simplicity of the workflow may not adequately illustrate the nonlinear steps that may occur.

#### Overview of key digital ICVP processes

<div>
<img src="fig2-overview-processes.png" alt="Fig. 2. Overview of key digital ICVP processes" style="width:85%"/>
</div>
<br/>

#### A. Register traveller

**Objective:** To correctly locate, identify, update or create a traveller record in the health information system to maintain accurate traveller information and vaccination documentation. This record will be used as the foundation for ICVP issuance.

<div>
<img src="fig3-workflow-a-register-traveller.png" alt="Fig. 3. Workflow A: Register traveller" style="width:85%"/>
</div>
<br/>

#### B. Administer vaccine and/or prophylaxis

**Objective:** To assess eligibility for vaccination, safely administer required vaccine(s) and monitor for adverse events.

<div>
<img src="fig4-workflow-b-administer-vaccine.png" alt="Fig. 4. Workflow B: Administer vaccine and/or prophylaxis" style="width:85%"/>
</div>
<br/>

#### C. Enter vaccination data in EIR

**Objective:** To review vaccination information from existing records, assess whether it meets ICVP requirements and record vaccination data in the EIR to support ICVP issuance.

<div>
<img src="fig5-workflow-c-enter-vaccination-data.png" alt="Fig. 5. Workflow C: Enter vaccination data in EIR" style="width:85%"/>
</div>
<br/>

#### D. Generate digital ICVP

**Objective:** To generate and digitally sign an ICVP using validated vaccination data and make it available to the traveller.

<div>
<img src="fig6-workflow-d-generate-digital-icvp.png" alt="Fig. 6. Workflow D: Generate digital ICVP" style="width:85%"/>
</div>
<br/>

#### E. Digital ascertainment of validity and authenticity of digital ICVP

**Objective:** To ascertain the validity and authenticity of a digital International Certificate of Vaccination or Prophylaxis (ICVP) presented by a traveller by validating the certificate data and verifying the cryptographic signature using digital means.

<div>
<img src="fig7-workflow-e-digital-ascertainment.png" alt="Fig. 7. Workflow E: Digital ascertainment of validity and authenticity of digital ICVP" style="width:85%"/>
</div>
<br/>

#### F. Non-digital ascertainment of validity and authenticity of digital ICVP

**Objective:** To ascertain the validity and authenticity of a digital International Certificate of Vaccination or Prophylaxis (ICVP) through visual inspection of the certificate and, where necessary, confirmation from the issuing State Party when automated verification through QR code scanning is not available or inconclusive.

<div>
<img src="fig8-workflow-f-non-digital-ascertainment.png" alt="Fig. 8. Workflow F: Non-digital ascertainment of validity and authenticity of digital ICVP" style="width:85%"/>
</div>
