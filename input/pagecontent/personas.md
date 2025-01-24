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
    <td>Certificate Identifier (CID)</td>
    <td>CID is the key identifier present on the model ICVP. The CID may be provided by an existing national system or alternatively, it could also be issued directly by the Certificate Generation Service which will then encode the ID in the DICVP. An index that associates the CID with metadata about the DICVP is stored in the Certificate Registry Service.</td>
    <td></td>
    <td></td>
  </tr>
  <tr class ="even">
    <td>Status Checking Application</td>
    <td>A digital solution that can inspect and cryptographically verify the validity of the ICVP. This can be an application on a mobile phone or another device.</td>
    <td></td>
    <td></td>
  </tr>
  <tr class ="odd">
    <td>Certificate Generation Service</td>
    <td>The service that is responsible for taking data about a vaccination event, converting that data to use the FHIR standard, signing that HL7 FHIR document, and returning it to the Digital Health Solution. The signed HL7 FHIR document is the DICVP. The Digital Health Solution is in turn responsible for distributing the DICVP and any associated representation of the data, such as a QR code, to the Certificate Holder based on PHA policy.</td>
    <td></td>
    <td></td>
  </tr>
  <tr class = "even">
    <td>Certificate Registry Service</td>
    <td>A service that is an index that is able to return metadata related to the DICVP (the signed FHIR document), such as its signature. This metadata may include the location from which the DICVP may be retrieved from the Certificate Repository, if one exists. The Certificate Registry Service can be utilized to determine whether a DICVP has been revoked, for example, due to revocation of a key within the PKI, a compromised batch of vaccinations, or issues within the supply chain. It is important to note that a Certificate Registry Service is not the same as an electronic immunization registry, which is commonly used for routine immunization programmes.</td>
    <td></td>
    <td></td>
  </tr>
  <tr class = "odd">
    <td>Certificate Repository Service</td>
    <td>The optional service that has a repository, or database, of all the DICVP and which is able to return a copy of the DICVP (the signed FHIR document) and potentially the one dimensional or two dimensional barcode representation (such as a QR code) of the signed FHIR document. This can be architected in a centralized or decentralized manner. Regardless, it is a mechanism that stores and persists the DICVP information.</td>
    <td></td>
    <td></td>
  </tr>
  <tr class = "even">
    <td>WHO GDHCN</td>
    <td>WHO Global Digital Health Certification Network for management of public keys through National HIEs for verification of digital signatures</td>
    <td>GDHCN, Trust Network Gateway, TNG, PKD, Public Key Directory</td>
    <td></td>
  </tr>
  <tr class = "odd">
    <td>WHO Terminology Service</td>
    <td> WHO hosted terminology service used for handling codesystems and valuesets used by national systems</td>
    <td> WHO TS, TS</td>
    <td></td>
  </tr>
</tbody></table>