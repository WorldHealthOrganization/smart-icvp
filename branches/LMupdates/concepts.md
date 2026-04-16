# Concepts - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Business Requirements**](business-requirements.md)
* **Concepts**

## Concepts

Key concepts, glossary terms and abbreviations are described here, based on the WHO Specifications and Standards for Digital ICVP.

### Glossary

| | |
| :--- | :--- |
| Amended model ICVP | Refers to the "Model International Certificate of Vaccination or prophylaxis" contained in Annex 6 - Vaccination, prophylaxis and related certificates of the International Health Regulations (2005), as amended through resolution WHA77.17 (2024). |
| Ascertainment | The process of determining whether an ICVP meets the requirements, through visual inspection, QR code scanning, and/or communication with the issuing State Party. |
| Authenticity | One or more features of the ICVP indicating that this was genuinely issued, and it was not counterfeited nor forged. |
| Ascertainment of authenticity | The process of determining whether an ICVP meets the requirements for being a genuinely issued, not counterfeited nor forged. |
| Ascertainment of validity | The process of determining whether an ICVP meets the legal requirements as to its conformity to the Model ICVP and format applying to the issuing State Party, it is duly completed, and it is in effect. |
| Business process | A set of related activities or tasks performed together to achieve the objectives of the health programme area, such as registration, counselling and referrals. |
| Data dictionary | A centralized repository of information about the data elements that contains their definition, relationships, origin, use and type of data. For this DAK, the data dictionary is provided as a spreadsheet. |
| Data element | A unit of data that has specific and precise meaning. |
| Decision-support logic | A set of decision rules for standard and exceptional cases that is separate from the business process. This would help reduce the complexity of the business process depiction without losing the detail necessary for coding the rules required for system functionality. |
| Decision-support table | Semi-structured way to depict each discrete decision that will need to be embedded in the digital service. Depending on the complexity of the clinical guidelines, there will likely be multiple decision-support tables. |
| Digital health | The systematic application of information and communications technologies, computer science and data to support informed decision-making by individuals, the health workforce and health systems, to strengthen resilience to disease and improve health and wellness. |
| Digital ICVP | An international Certificate of Vaccination or Prophylaxis (ICVP) issued by the digital services that are authorized by the State Party as part of the onboarding onto the Global Digital Health Certification Network (GDHCN), within its ICVP Trust Domain, as a QR code containing cryptographic signature compliant and conformant to GDHCN ICVP Trust Domain requirements. Each unique QR code generated represents only a single administration of a vaccination or prophylaxis. |
| Dynamic QR Payload | A QR code that contains only a reference (e.g., a URL or token) linking to data stored on a remote server, requiring online verification. |
| Format of the ICVP | The medium in which the ICVP is issued, including digital or non-digital formats. |
| Functional requirement | Capabilities the digital service must have to meet the end users' needs and achieve tasks within the business process. |
| Global Digital Health Certification Network (GDHCN) | A WHO-governed trust network and an open, interoperable digital public infrastructure, that facilitates the verification and secure exchange of Verifiable Digital Health Certificates issued and utilized by GDHCN Participants. |
| Health information system | A system that integrates data collection, processing, reporting and use of the information necessary for improving health service effectiveness and efficiency through better management at all levels of the health services. |
| Health management information system (HMIS) | A type of health information system specifically designed to assist in the management and planning of health programmes, as opposed to delivery of care. |
| ICVP Trust domain | The trust domain within WHO GDHCN dedicated to the issuance and ascertainment of digital ICVPs. |
| Interoperability | The ability of different applications to access, exchange, integrate and use data in a coordinated manner through the use of shared application interfaces and standards, within and across organizational, regional and national boundaries, to provide timely and seamless portability of information and optimize health outcomes. |
| Issuer | The authority designated by a State Party to issue an International Certificate of Vaccination or Prophylaxis (ICVP), either in paper or digital format, in accordance with Annex 6 of the International Health Regulations (2005). The issuer is responsible for the accuracy of the information recorded and for ensuring that the certificate meets the technical and procedural requirements for validity and authenticity. |
| Model ICVP | The "Model International Certificate of Vaccination or prophylaxis" contained in Annex 6 - Vaccination, prophylaxis and related certificates of the IHR. |
| Non-amended model ICVP | The "Model International Certificate of Vaccination or prophylaxis" contained in Annex 6 - Vaccination, prophylaxis and related certificates of the IHR as amended through resolution WHA67.13 (2014) and WHA75.12 (2022). |
| Non-digital ICVP | An ICVP issued on paper that carries a wet ink signature wherever a signature, or mark, is required, and a wet ink stamp wherever a stamp is required as per the Model ICVP in Annex 6. |
| Non-functional requirement | General attributes and features of the digital service to ensure usability and overcome technical and physical constraints. Examples of non-functional requirements include the ability to work offline, multiple language settings and password protection. |
| Persona | A generic aggregate description of a person involved in or benefitting from a health programme. |
| Personal immunization record | A record of an individual's vaccination history, maintained either by the individual (e.g. home-based record) or within a health information system. |
| QR Payload | The structured data contained in the QR code of a digital ICVP. It includes the certificate data elements (e.g., holder name, vaccine, date, issuer) and the cryptographic signature. |
| Selective disclosure | A feature of the digital ICVP that enables the traveller to display only the relevant QR code or specific data required for inspection, without disclosing additional or unrelated information. |
| Standard | In software, a standard is a specification used in digital application development that has been established, approved and published by an authoritative organization. These rules allow information to be shared and processed in a uniform, consistent manner independent of a particular application. |
| Static QR Payload | A QR code that contains all certificate data and the cryptographic signature within the code itself. |
| Subject (if different than holder/recipient) | In limited cases, the person whose health data are recorded may differ from the person presenting the certificate (for example, when a parent or guardian presents the ICVP of a child or those unable to 'sign'). In such instances, "subject" refers to the person who received the vaccine or prophylaxis. |
| Task | A specific action in a business process. |
| Terminologies | For clinical care, terminologies are structured vocabularies covering health-related concepts, such as diseases, diagnoses, laboratory tests and treatments, to enable the storage, analysis and exchange of data in a consistent and standard way. |
| Traveller | A natural person undertaking an international voyage, as defined in Article 1 - Definitions of the IHR. The individual to whom the ICVP relates/belongs to, that is, the person who received the vaccine or prophylaxis. |
| Trust domain | Trust Domain of GDHCN consists of: defined use cases and business processes related to the utilization of Verifiable Digital Health Certificates; the open, interoperable technical specifications that identify or define the applicable Trusted Services and Verifiable Digital Health Certificates; and a set of policy and regulatory standards describing expected behavior of GDHCN Participants in relation to operation of the Trusted Services and utilization of Verifiable Digital Health Certificates (e.g. data minimization, privacy, scope of use). |
| Trust network | The GDHCN Trust Network is a trust network comprised of the GDHCN Secretariat and GDHCN Participants. It operationalizes trust domains through a Trust Network Gateway by enabling bilateral verification and utilization of Verifiable Digital Health Certificates and Trusted Services by GDHCN Participants. |
| Validity | The conformity of the features, format, and content of the ICVP to the Model ICVP applicable to the issuing State Party and whether the certificate is in effect. |
| Verifiable Digital Health Credential | A digital representation of a data set comprising a certificate or document, designed for a set of specific clinical or public health use cases which is defined using open, interoperable digital health standards; that contains within, or is associated to, a digital signature which can be verified by the public key of a public-private encryption key pair, and which is issued by a GDHCN Participant. |
| Verifier | An authorized person or digital service that examines an ICVP, visually or digitally, to ascertain its validity, authenticity, and integrity for the purpose of international travel or public-health control measures. Examples include border health officers and health workers. |
| Workflow | A visual representation of the progression of activities (tasks, events, decision points) in a logical flow illustrating the interactions within the business process. |

### Abbreviations

| | |
| :--- | :--- |
| BPMN | Business Process Model and Notation |
| DAK | Digital adaptation kit |
| DT | Decision support table |
| EIR | Electronic immunization registry |
| EMR | Electronic medical record |
| FHIR | Fast Healthcare Interoperability Resources |
| GDHCN | Global Digital Health Certification Network |
| HMIS | Health management information system |
| HL7 | Health Level Seven International |
| ICD | International Classification of Diseases |
| ICF | International Classification of Functioning, Disability and Health |
| ICHI | International Classification of Health Interventions |
| ICVP | International Certificate of Vaccination or Prophylaxis |
| ID | Identification |
| IHR | International Health Regulations |
| LOINC | Logical Observation Identifiers Names and Codes |
| NFP | National IHR Focal Point |
| PHA | Public health authority |
| PKI | Public key infrastructure |
| QR | Quick Response (code) |
| SMART | Standards-based, machine-readable, adaptive, requirements-based and testable |
| SNOMED | Systematized Nomenclature of Medicine |
| WHA | World Health Assembly |
| WHO | World Health Organization |

