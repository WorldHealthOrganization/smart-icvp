This page includes a depiction of end-users and related stakeholders as introduced in the WHO Digital Adaptation Kit for Digital ICVP.


### Targeted generic personas


**Descriptions of key generic personas**

<table border="1" class="dataframe table table-striped table-bordered">
<thead>
  <tr class="header">
    <th><strong>Role</strong></th>
    <th><strong>Description</strong></th>
    <th><strong>Different Names</strong></th>
    <th><strong>ISCO Codes (if applicable)</strong></th>
  </tr></thead>
<tbody>
  <tr class ="odd">
    <td>Certificate Holder</td>
    <td>A person who holds the ICVP certificate and wants to assert a claim related to a vaccination. This person could be the same as the Subject of Care or, for example, could be a caregiver who may hold the certificate for a child or other dependant.</td>
    <td>Traveller</td>
    <td></td>
  </tr>
  <tr class = "even">
    <td>Verifier</td>
    <td>The person or entity that wants to verify the vaccination status claim,  i.e. verify the vaccination status shown on an ICVP</td>
    <td></td>
    <td></td>
  </tr>
  <tr class ="odd">
    <td>National Public Health Authority (PHA)</td>
    <td>The entity that has overall responsibility for vaccinating the country’s population. The National PHA is also responsible for the ICVP Generation Service and the ICVP Registry Service.</td>
    <td></td>
    <td></td>
  </tr>
  <tr class = "even">
    <td>International PHA</td>
    <td>Any external PHA to which the National PHA might defer to verify certificates not issued by the National PHA. This could be a PHA in another country, but it could also be any regional level or international organization.</td>
    <td></td>
    <td></td>
  </tr>
</tbody></table>
<br/>

### Digital services

The digital services needed to support the issuance and ascertainment of validity and authenticity of an ICVP in digital format include:

<table border="1" class="dataframe table table-striped table-bordered">
<thead class = "header">
  <tr>
    <th><strong>Role</strong></th>
    <th><strong>Description</strong></th>
    <th><strong>Different Names</strong></th>
    <th><strong>ISCO Codes (if applicable)</strong></th>
  </tr></thead>
<tbody>
  <tr class = "odd">
    <td>Immunization or Prophylaxis Registry</td>
    <td>To support the issuance of an ICVP in digital format, there needs to be a digital service that collects and manages individual vaccination and/or prophylaxis records to serve as the source of vaccination or prophylaxis event data that would enable the generation of the ICVP in digital format by providing validated data to the **Certificate Generation Service**. It is at the discretion of the State Party, based on the national health enterprise architecture, what system to use as the source of vaccination or prophylaxis event data. In the context of the ICVP in digital format, this digital service can be filled with digital systems such as an electronic immunization registry (EIR), electronic medical record (EMR) system, an electronic health record (EHR) system, a community health information system, a dedicated point of care application or other. Where non-digital ascertainment of authenticity is necessary, the Immunization or Prophylaxis Registry may be consulted to determine whether the ICVP was issued to the traveller present.</td>
    <td></td>
    <td></td>
  </tr>
  <tr class ="even">
    <td>Certificate Generation Service</td>
    <td>A digital service that receives vaccination or prophylaxis data from an authorized source (i.e. the **Immunization or Prophylaxis Registry**), checks the data for completeness and conformance with the applicable ICVP data structure and certificate schema, converts the data into a standardized digital format (e.g. Health Level Seven International (HL7) Fast Healthcare Interoperability Resources (FHIR)), applies a cryptographic signature, and returns the signed ICVP to the issuing authority or traveller. The cryptographically signed document represents the ICVP in digital format. It is at the discretion of the State Party, based on the national health enterprise architecture, what system to use as a Certificate Generation Service.</td>
    <td></td>
    <td></td>
  </tr>
  <tr class ="odd">
    <td>Status Checking Application</td>
    <td>Also sometimes referred to as a “verifier application”, or “ICVP verifier”. The Status Checking Application is a digital solution that can inspect, cryptographically verify, and ascertain the validity and authenticity of an ICVP in digital format using predefined acceptance criteria or business rules. This can be an application on a mobile phone or otherwise, and it can operate online or offline. It is at the discretion of the State Party, based on the national health enterprise architecture, what system to use as a Status Checking Application.</td>
    <td></td>
    <td></td>
  </tr>
  <tr class = "even">
    <td>WHO Terminology Service</td>
    <td> WHO hosted terminology service used for handling codesystems and valuesets used by national systems</td>
    <td> WHO TS, TS</td>
    <td></td>
  </tr>
</tbody></table>
