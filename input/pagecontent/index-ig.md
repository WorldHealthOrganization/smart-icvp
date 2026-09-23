The **International Certificate of Vaccination or Prophylaxis (ICVP)** is the health document established under the International Health Regulations (2005) (IHR) for recording the administration of a vaccine or prophylaxis. Following the amendments adopted through resolution WHA77.17 (2024), an ICVP may be issued in non-digital or digital format, subject to the provisions applicable to the issuing State Party. 

This **WHO ICVP Implementation Guide** provides technical specifications and machine-readable artifacts to support the issuance and ascertainment of validity and authenticity of an ICVP in digital format. It defines how Health Level Seven (HL7®) Fast Healthcare Interoperability Resources (FHIR®) and related interoperability standards are used to represent and exchange ICVP data consistently.

The guide is intended for government authorities and technical teams responsible for implementing the IHR, border health programmes, digital health programmes, immunization or prophylaxis registries, certificate generation services, and status checking applications.

### Scope
This implementation guide supports the digital implementation of the amended Model ICVP contained in Annex 6 of the IHR. It includes:
- the core data elements required for an ICVP in digital format;
- standardized data models, terminology bindings, and exchange specifications;
- validation logic derived from applicable IHR requirements;
- functional and non-functional requirements for relevant digital services;
- technical requirements for generating, displaying, scanning, and processing ICVP QR codes; and
- trust, security, privacy, and interoperability requirements associated with the Global Digital Health Certification Network (GDHCN) ICVP Trust Domain.

Implementers should use it together with the applicable IHR provisions and WHO guidance related to the issuance and ascertainment of validity and authenticity of the ICVP in non-digital and digital formats.

### Role of the ICVP Trust Domain
The ICVP Trust Domain supports implementation of the ICVP in digital format by enabling participating States Parties to establish and exchange the trusted information needed to ascertain the authenticity of ICVPs in digital format. It provides the trust framework and technical infrastructure supporting two core functions:
- Issuance: Generating an ICVP in digital format from vaccination or prophylaxis information in accordance with applicable IHR requirements and cryptographically signing it so that its validity and authenticity can be ascertained.
- Ascertainment of validity and authenticity: Determining whether an ICVP in digital format conforms to the applicable requirements and whether it was genuinely issued by an authorized issuing authority.

### Disclaimer
The specification herewith documented is a demo working specification and may not be used for any implementation purposes. This draft is provided without warranty of completeness or consistency and the official publication supersedes this draft. No liability can be inferred from the use or misuse of this specification or its consequences.

<div>
<p> This implementation guide and set of artifacts are still undergoing development. </p>
<p> Content is for demonstration purposes only. </p>
</div>{:.stu-note}


