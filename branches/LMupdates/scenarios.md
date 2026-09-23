# User Scenarios - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* [**Business Requirements**](business-requirements.md)
* **User Scenarios**

## User Scenarios

Component 3 in the WHO Specifications and Standards for Digital ICVP includes user scenarios, which are narrative descriptions of how the end-user could interact with the digital service. The user scenarios provide a better understanding of how the digital service will be used and how it could fit into existing workflows, providing context in a storytelling format.

**How to interpret user scenarios**

User scenarios are helpful tools for better understanding the context in which a digital tool would operate. They offer insights into the key data elements that need to be recorded and accounted for in the database. The context in which the tool would operate, illuminated by user scenarios, provides insight into some functional and non-functional requirements that the digital service would need.

### User Scenarios

#### User scenario for issuance of a digital ICVP at the point of care when the traveller has no prior immunization history

**Key Personas & Services:**

* Traveller: Jessy
* Health worker: Amina
* [digital service] Electronic immunization registry (EIR)
* [digital service] Certificate generation service

Jessy is a 28-year-old preparing for international travel. While reviewing travel requirements for her destination country, she learns that proof of yellow fever vaccination is required. As she has not previously received this vaccination, she visits a nearby travel clinic that is authorized to administer vaccines and issue ICVP.

At the clinic, Amina, a health worker responsible for travel vaccinations, begins by searching for Jessy in the Electronic Immunization Registry (EIR) using her name, date of birth and sex. As no existing record is found, Amina creates a new traveller record for Jessy. Before proceeding, Amina reviews the recorded demographic details. To support identity binding, Amina requests Jessy's passport and verifies that the name and date of birth match the information recorded in the EIR. With Jessy's consent, Amina records the passport as her national identification document and includes the identification number in the record.

Amina then reviews Jessy's travel destination and Jessy's vaccination history and determines that Jessy requires a yellow fever vaccination. Jessy confirms that she has never received a yellow fever vaccination. Amina conducts a clinical assessment to identify any potential contraindications. As Jessy does not have any contraindications, she is eligible for vaccination. Amina confirms that vaccine is available at the clinic and provides counselling on the vaccination, including its purpose and possible side effects. After obtaining Jessy's informed consent, Amina prepares and administers the yellow fever vaccine.

Following administration, Amina monitors Jessy for any adverse reaction and in the meantime starts entering the vaccination data in EIR. The recorded information includes the vaccine or prophylaxis product, batch number, date of administration, and name of supervising clinician or issuing authority. Based on the vaccine or prophylaxis product entered, the EIR automatically derives and populates related data elements, such as the name of disease and manufacturer. After ensuring that all required data elements are complete, Amina initiates a request to issue digital ICVP.

This request is sent to the Certificate Generation Service, which retrieves and validates the data for completeness. The service generates a digital ICVP containing the required human-readable information and a machine-readable QR code and applies a cryptographic signature to ensure authenticity. The digital ICVP is then made available.

Amina receives a notification that the digital ICVP is ready. She reviews the digital ICVP with Jessy and explains how it can be used for travel. Jessy receives a secure notification enabling access to her digital ICVP. Amina also provides a printed copy for backup use during travel.

Jessy leaves the clinic with her vaccination completed and a valid digital ICVP that can be presented, as required, during international travel.

**Corresponding business processes (see Component 4):** This scenario refers to the following business processes:

* A. Register traveller
* B. Administer vaccine and/or prophylaxis
* C. Enter vaccination data in EIR
* D. Generate digital ICVP

-------

#### User scenario for issuance of a digital ICVP based on paper ICVP

**Key Personas & Services:**

* Traveller: Rahul
* Health Worker: Fatima
* [digital service] Electronic immunization registry (EIR)
* [digital service] Certificate generation service

Rahul is a 34-year-old preparing for an upcoming international trip to a country where proof of yellow fever vaccination is required at the point of entry. As his departure date approaches, he reviews the travel requirements and confirms that he must carry an ICVP.

Rahul already possesses a paper ICVP ("yellow card"), which he received several years ago following vaccination against yellow fever. To ensure easier access and avoid the risk of losing the paper document during travel, he decides to obtain a digital version of the ICVP.

He visits a nearby travel clinic that is authorized by the national public health authority to issue ICVPs. At the clinic, Fatima, a health worker responsible for vaccination services and ICVP issuance, assists Rahul. He explains that he would like to convert his paper ICVP into a digital ICVP in preparation for his upcoming travel.

Fatima begins by searching for Rahul in the EIR using his demographic information. Fatima requests Rahul's passport and verifies that the name and date of birth match the information recorded in EIR. She then reviews the demographic details with Rahul to ensure that they are accurate and up to date.

Fatima then reviews the paper ICVP presented by Rahul and performs a visual inspection to verify that it is complete and appears valid. She confirms that the paper ICVP includes clinician's signature with wet ink, the official stamp of the vaccination center, the date of vaccination and completion of all required fields. She also verifies that the recorded vaccine corresponds to a WHO-approved yellow fever vaccine. Although the booklet shows minor signs of wear, all required information is legible and complete.

Fatima determines that the vaccination record meets digital ICVP requirement and enters the vaccination information from paper ICVP into the EIR as a historical vaccination record. This includes vaccination data such as the vaccine product, batch number, date of administration, name of supervising clinician or issuing authority. Based on the vaccine or prophylaxis product entered, the EIR automatically derives and populates related data elements, such as the name of disease and manufacturer. She verifies that the entered information accurately reflects the paper certificate. After entering and validating all required data elements, Fatima initiates a request in the EIR to issue a digital ICVP.

This request is sent to the Certificate Generation Service, which retrieves and validates the data for completeness. The service generates a digital ICVP containing the required human-readable information and a machine-readable QR code and applies a cryptographic signature to ensure authenticity. The digital ICVP is then made available.

Fatima receives a notification that the digital ICVP is ready. Fatima reviews the digital ICVP with Rahul and confirms that the information matches with the original paper ICVP. She explains how the digital ICVP can be accessed and used during international travel. Rahul receives a notification enabling access to his digital ICVP. Fatima also provides a printed copy in case of technical difficulties during travel.

Rahul leaves the clinic with both his original paper ICVP and a newly issued digital ICVP, ready for use during his upcoming international travel.

**Corresponding business processes (see Component 4):** This scenario refers to the following business processes:

* A. Register traveller
* C. Enter vaccination data in EIR
* D. Generate digital ICVP

-------

#### User scenario for issuance of a digital ICVP from an existing electronic record (self-service)

**Key Personas & Services:**

* Traveller: Ananya
* [digital service] Traveller portal
* [digital service] Certificate generation service

Ananya is a 27-year-old preparing for international travel. While reviewing the entry requirements of her destination country, she learns that proof of yellow fever vaccination is required at the point of entry. She recalls having received a yellow fever vaccination previously but was not able to find her paper record.

Ananya's country's public health authority provides a national traveller portal through which individuals can access their immunization history. To obtain proof of vaccination for her upcoming travel, Ananya accesses the portal using her phone and authenticates herself using her national digital identity credentials.

Upon successful authentication, the portal then retrieves Ananya's demographic information and vaccination history. Ananya is able to view her recorded yellow fever vaccination along with other vaccinations. Since a valid electronic vaccination record is available, Ananya selects the option to request a digital ICVP for international travel.

This request is sent to the Certificate Generation Service, which retrieves and validates the data for completeness. The service generates a digital ICVP containing the required human-readable information and a machine-readable QR code and applies a cryptographic signature to ensure authenticity. The digital ICVP is then made available through the traveller portal for Ananya to access.

She accesses the digital ICVP through the portal, reviews the information and confirms that it is correct. Ananya downloads the digital ICVP to her device, saves a copy for use during travel and prints a backup copy for inclusion with her travel documents.

Ananya proceeds with her travel preparation, confident that she has a valid digital ICVP that can be presented, as required, at international borders.

**Corresponding business processes (see Component 4):** This scenario refers to the following business processes:

* A. Register traveller
* D. Generate digital ICVP

-------

#### User scenario for digital ascertainment of validity and authenticity of a digital ICVP using QR code

**Key Personas & Services:**

* Traveller: Rahul
* Border Health Inspector: Luis
* [digital service] Status Checking Application

Rahul arrives in a country where proof of yellow fever vaccination is required under the IHR (2005). As part of the entry procedures, he is asked to present his ICVP.

Rahul presents his digital ICVP to Luis, a border health inspector. Luis first reviews Rahul's identity by comparing the demographic details displayed on the digital ICVP with Rahul's passport to ensure that the digital ICVP belongs to him. The information matches.

Luis then scans the QR code displayed on the digital ICVP using the status checking application. The QR code is a static QR payload containing the encoded vaccination data and a cryptographic signature. The application retrieves and displays Rahul's vaccination details, including vaccine information, date of vaccination, the issuing authority and validity period.

The application begins the ascertainment process. It first verifies the authenticity of the digital ICVP and checks its revocation status. Using trusted public keys made available through the National PHA, it confirms that the digital signature is valid and that it has been issued by a trusted authority.

The application begins by checking that all required data elements are present in accordance with the IHR (2005). It then evaluates whether the vaccination meets the required validity criteria. The application confirms that the digital ICVP is valid, as the vaccination was administered more than 10 days ago and the vaccine is on the list of WHO-approved vaccines under Prequalification (PQ) or Emergency Use Listing (EUL). It also confirms that the certificate is complete and does not contain any inconsistencies or indications of alteration.

Within seconds, the application displays confirmation indicating that the digital ICVP is valid and authentic. Satisfied that all requirements have been met, Luis accepts the digital ICVP and allows Rahul to proceed.

**Corresponding business processes (see Component 4):** This scenario refers to the following business processes:

* E. Digital ascertainment of validity and authenticity of digital ICVP

-------

#### User scenario for non-digital ascertainment of validity and authenticity of a digital ICVP

**Key Personas & Services:**

* Traveller: Jessy
* Border Health Inspector: Alex
* National / International Public Health Authority (PHA)

Jessy arrives in a country where proof of yellow fever vaccination is required under the IHR (2005). As part of the entry procedures, she presents her digital ICVP to the border health inspector.

Alex, a border health inspector, receives the digital ICVP and begins by reviewing Jessy's identity by comparing the demographic details displayed on the digital ICVP with her passport. The information matches, confirming that the digital ICVP corresponds to Jessy.

As status checking application is not available, Alex proceeds by visually inspecting the digital ICVP. He reviews the human-readable information displayed on Jessy's device including her name, date of birth, nationality, vaccine details, date of vaccination, issuing authority and validity period.

Based on this inspection, Alex determines that the digital ICVP appears complete and that the vaccination was administered more than 10 days ago. Alex then checks whether the authenticity of the digital ICVP can be ascertained. While the digital ICVP appears complete and includes a QR code and issuing authority details, he notices that the format of the issuing authority information is different from what is typically observed. As a result, he is unable to confidently ascertain authenticity of the digital ICVP through visual inspection.

In accordance with the established procedures, Alex initiates a request for ascertainment of authenticity from the issuing State Party. The request is sent through national channels to the national IHR focal point, which contacts the relevant authority in the issuing State Party to verify whether the ICVP was genuinely issued. The relevant authority in the issuing State Party checks their internal database(s) to determine whether the ICVP was genuinely issued to Jessy.

After a short period, a response is received confirming that the digital ICVP is authentic and was issued by a recognized authority.

Alex reviews the verification result and confirms that both validity and authenticity requirements have now been met.

Satisfied that the digital ICVP conforms to the required format, is duly completed, and is in effect, and that its authenticity has been established, Alex accepts the digital ICVP and allows Jessy to proceed.

**Corresponding business processes (see Component 4):** This scenario refers to the following business processes:

* F. Non-digital ascertainment of validity and authenticity of digital ICVP

-------

#### User scenario for non-digital ascertainment of validity and authenticity of a digital ICVP using a national verification portal

**Key Personas & Services:**

* Traveller: Ananya
* Border Health Inspector: Ali
* [digital service] National verification portal
* National / International Public Health Authority (PHA)

Ananya arrives in a country where proof of yellow fever vaccination is required under the IHR (2005). As part of the entry procedures, she presents a printed version of her digital ICVP to the border health inspector.

Ali, a border health inspector, receives the printed digital ICVP and begins by reviewing Ananya's identity by comparing the demographic details displayed on the digital ICVP with her passport. The information matches, confirming that the digital ICVP corresponds to Ananya.

As a status checking application is not available, Ali proceeds by visually inspecting the digital ICVP. He reviews the human-readable information including her name, date of birth, nationality, vaccine details, date of vaccination, issuing authority and validity period.

Based on this inspection, Ali determines that the digital ICVP appears complete and that the vaccination was administered more than 10 days ago. Ali then checks whether the authenticity of the digital ICVP can be ascertained. While the digital ICVP appears complete and includes a QR code and issuing authority details, he notices that the issuing authority is not familiar and cannot be verified based on the information displayed. As a result, he is unable to confidently ascertain authenticity of the digital ICVP through visual inspection.

In accordance with the established procedures, Ali accesses a verification portal operated by the PHA that issued Ananya's ICVP and enters key details from the digital ICVP, including the document ID and traveller information. The portal uses this information to query official vaccination records maintained in the EIR of the issuing State Party, through trusted verification mechanisms, to retrieve the corresponding vaccination record and confirm whether the digital ICVP was issued by a recognized authority to Ananya.

The portal returns a confirmation indicating that the vaccination record is valid and that the digital ICVP was issued by an authorized issuer.

Based on this confirmation, Ali determines that both the validity and authenticity of the digital ICVP have been ascertained. He accepts the digital ICVP and allows Ananya to proceed.

**Corresponding business processes (see Component 4):** This scenario refers to the following business processes:

* F. Non-digital ascertainment of validity and authenticity of digital ICVP

