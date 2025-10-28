Component 3 in the Digital Adaptation Kit (link forthcoming) includes user scenarios, which are narratives that describe how the different personas may interact with each other. The user scenarios are only illustrative and are intended to give an idea of a typical workflow.

**How to interpret user scenarios**

User scenarios can be helpful tools not only to better understand the context in which a digital tool would operate, but also for some insights into what key data elements would need to be recorded and accounted for in the database. Additionally, the context in which the tool would operate, illuminated by the user scenarios, provides insight into some functional and non-functional requirements that the system would also need.

As examples, the scenarios identify: key data elements that need to be recorded and/or calculated; decision-support logic that can be automated in the system; key functional and non-functional requirements that should be included in the system, and adolescent-specific considerations that should be accounted for.

### ICVP User Scenarios

#### A. Issuing an Offline ICVP for Travel

**Key personas:** Individual/Client (Holder), Digital Health Wallet, Certificate Issuance Service

Sarah is planning international travel and needs to obtain a digital International Certificate of Vaccination or Prophylaxis (ICVP). She logs into her country's digital health wallet application on her mobile device. Once authenticated, she navigates to the certificate services section and requests the issuance of a digital ICVP card based on her existing immunization records stored in the Electronic Immunization Registry (EIR).

The digital health wallet system displays information about the digitization process and prompts Sarah to select the reason for certificate issuance. She selects "Travel" from the available options, which include travel, continuity of care, and personal records. The system explains how her data will be used and stored, and prompts Sarah for her consent to create a digital version of her vaccination records. Sarah reviews the information and provides her consent by accepting the terms displayed on screen.

Upon receiving Sarah's consent, the system records this authorization in the consent registry and begins collating her ICVP data from the EIR. The Certificate Issuance Service retrieves her relevant vaccination records, including vaccine type, dates of administration, batch numbers, and administering healthcare facility information.

Because Sarah selected "Travel" as the reason for issuance, the system automatically configures the certificate for offline verification. This ensures that her vaccination credentials can be verified at border crossings even in locations with limited or no internet connectivity. The system embeds the complete ICVP payload directly into the certificate, including all her vaccination details, demographic information, and the certificate metadata. The system generates a QR code containing the embedded data, digitally signed by the issuing health authority to prevent tampering.

The digital ICVP card is now issued and available in Sarah's digital health wallet. She can view her vaccination details, including the QR code that can be presented for verification at borders. The certificate includes her demographic information, complete vaccination history with all required details for international travel health regulations (vaccine names, dates, batch numbers, administering facilities), the unique certificate identifier, validity period, and the digital signature ensuring authenticity. Because this is an offline certificate, all verification data is contained within the QR code itself, allowing border officials to verify her credentials without needing to query external databases.

#### B. Verifying an Offline ICVP at the Border

**Key personas:** Certificate Holder (traveler), Border Health Official/Verifier, Status Checking Application

Sarah arrives at the international airport immigration checkpoint for her destination country. As part of the entry requirements, Border Health Officer James requests her proof of vaccination. Sarah opens her digital health wallet on her smartphone and presents her digital ICVP by displaying the QR code on her screen.

Officer James uses the border health authority's status checking application on his tablet device. He initiates the verification process by scanning Sarah's QR code using the tablet's camera. The application first validates that the QR code has the correct format with the HC1 prefix, deserializes the data, and identifies the key ID and issuing authority information embedded within.

The system checks whether the issuing authority is recognized in the trusted network of certificate issuers. Finding that Sarah's certificate was issued by a trusted national health authority, the application fetches the corresponding public key from its local cache of trusted keys. Since this is an offline verification scenario, the application does not require internet connectivity and relies entirely on the public keys that were previously synchronized and stored locally on the device. Using this public key, the system verifies the digital signature on Sarah's certificate to ensure it hasn't been tampered with and was genuinely issued by the claimed authority.

Once the signature is successfully verified, the application determines that this is an offline certificate with the complete payload embedded within the QR code. The system extracts the vaccination data directly from the embedded payload without needing to query any external systems. The application applies business rules to validate the certificate claim. It checks that Sarah's Yellow Fever vaccination was administered at least 10 days before arrival, that the vaccine hasn't expired, and that all required vaccinations for the destination country are present based on the embedded data.

The verification application displays the result to Officer James. The screen shows a green "Valid" status, confirming that Sarah's certificate is authentic and meets all entry requirements. Officer James reviews the displayed information, which includes Sarah's name matching her passport, the complete vaccination details with dates and vaccine types (all extracted from the embedded payload), and the verification status. The system also indicates that this was an offline verification, meaning no external queries were required. Satisfied that everything is in order, he stamps Sarah's passport and allows her to proceed through immigration. The system logs this verification event locally on the tablet, recording the date, time, certificate ID, and outcome. This log will be synchronized with the border health surveillance system when connectivity is restored for public health monitoring purposes.

The offline verification capability ensures that Sarah's credentials can be checked even in remote border locations or during network outages, providing resilience and reliability for international travel health security.

#### C. Issuing an Online ICVP for Continuity of Care

**Key personas:** Individual/Client (Holder - Sarah), Healthcare Provider (Dr. Patel), Digital Health Wallet, Certificate Issuance Service

Two months after returning from her international trip, Sarah develops a fever and visits her local health clinic for medical attention. During check-in at the clinic reception, Sarah realizes that her previously issued travel ICVP has expired. She decides to generate a new ICVP that can be used for healthcare purposes while at the clinic.

Sarah opens her digital health wallet application on her smartphone and navigates to the certificate services section. She requests the issuance of a new digital ICVP card based on her current immunization records stored in the Electronic Immunization Registry (EIR). The system prompts Sarah to select the reason for certificate issuance. She selects "Continuity of Care" from the available options, indicating that this certificate will be used for healthcare purposes rather than travel.

The digital health wallet system displays information about the digitization process and prompts Sarah for her consent to create a new digital version of her vaccination records. The system explains that selecting continuity of care means the certificate will be configured for online verification, allowing healthcare providers to access the most current and comprehensive vaccination data from authoritative sources. Sarah reviews the information and provides her consent by accepting the terms displayed on screen.

Upon receiving Sarah's consent, the system records this authorization in the consent registry and begins collating her ICVP data from the EIR. The Certificate Issuance Service retrieves her relevant vaccination records, including vaccine type, dates of administration, batch numbers, administering healthcare facility information, and any recent updates to her immunization history.

Because Sarah selected "Continuity of Care" as the reason for issuance, the system automatically configures the certificate for online verification. This approach is optimal for healthcare settings where internet connectivity is generally available and where providers may need access to the most detailed and up-to-date vaccination information, including any recent additions or amendments to the records. The system generates a Verifiable Health Link (VHL) that points to Sarah's vaccination records stored securely in the national health system, rather than embedding the complete payload.

The system generates a QR code containing the VHL and minimal identifying information, digitally signed by the issuing health authority. The digital ICVP card is now issued and available in Sarah's digital health wallet with a new validity period. She can view her basic vaccination summary and the QR code. When verified, this certificate will allow healthcare providers to retrieve her complete, current vaccination history from the authoritative source, ensuring Dr. Patel has access to the most accurate and comprehensive information for clinical decision-making.

Sarah proceeds to her appointment with Dr. Patel, ready to share her newly issued ICVP for continuity of care purposes.

#### D. Verifying an Online ICVP for Continuity of Care

**Key personas:** Certificate Holder (patient - Sarah), Healthcare Provider (Dr. Patel), Status Checking Application, National/International Public Health Authority (PHA)

During the initial consultation, Dr. Patel, the attending physician, asks about Sarah's recent travel history as part of the clinical assessment. Sarah mentions she recently traveled to a Yellow Fever endemic region in West Africa. Recognizing the relevance to Sarah's current symptoms, Dr. Patel requests to review Sarah's vaccination records.

Sarah retrieves her digital health wallet on her phone and displays her newly issued digital ICVP for continuity of care. Dr. Patel asks for permission to verify the certificate details for clinical purposes, and Sarah consents by showing the QR code.

Dr. Patel uses the clinic's health information system, which has an integrated ICVP verification module. She scans Sarah's QR code using the system's scanner. The application follows the online verification process: it validates the QR code format with the HC1 prefix, deserializes the data, and identifies the Verifiable Health Link (VHL) along with the key ID and issuing authority information embedded within.

The system checks whether the issuing authority is recognized in the trusted network of certificate issuers. Finding that Sarah's certificate was issued by a trusted national health authority, the application fetches the corresponding public key from either the trust network gateway or from its local cache of trusted keys. Using this public key, the system verifies the digital signature on Sarah's certificate to confirm the VHL is authentic and hasn't been tampered with.

Once the signature is successfully verified, the application recognizes this as an online certificate containing a VHL rather than an embedded payload. The system uses the VHL to send a secure query to the issuing country's Public Health Authority certificate repository to retrieve Sarah's complete and current vaccination details.

The National PHA receives the request, authenticates the requesting system, identifies Sarah's certificate in the certificate registry, retrieves the complete and most up-to-date record from the certificate repository, and returns the comprehensive vaccination data to the verification application. The system extracts the payload and applies business rules to validate the certificate claim. It checks the vaccination dates and types, confirms the certificate hasn't been revoked, and verifies that the data is current.

The verification application displays the result to Dr. Patel. The screen shows a "Valid" status with comprehensive vaccination details retrieved in real-time from the authoritative source. Dr. Patel reviews the information displayed: Sarah received her Yellow Fever vaccination 45 days ago, which rules out Yellow Fever as a cause of her current symptoms (the incubation period has passed and she is protected). The record also shows the vaccine product name, manufacturer, batch number (important for tracking any potential adverse events), the administering facility, date of vaccination, and confirmation that no adverse reactions were documented at the time of vaccination.

The online verification provides Dr. Patel with the most complete and current information available, including any recent vaccinations Sarah may have received that wouldn't be present in an older offline certificate. This real-time access to authoritative data supports more accurate clinical decision-making.

With Sarah's consent, Dr. Patel uses the system's import function to add the verified ICVP data to Sarah's local electronic health record. This integration ensures Sarah's complete vaccination history is now part of her permanent medical record at the clinic. The system automatically identifies any gaps in Sarah's routine immunizations by comparing the imported data against national immunization schedules, and flags that Sarah is due for a tetanus booster.

Based on the verified vaccination information and clinical assessment, Dr. Patel rules out vaccine-preventable diseases related to travel. She proceeds with alternative diagnostic workup for Sarah's fever. Before Sarah leaves, Dr. Patel counsels her on maintaining her digital ICVP, explains that she now has a continuity of care certificate that will provide healthcare providers with current information, schedules the recommended tetanus booster, discusses other vaccinations she might need based on her travel patterns, and advises her to report any delayed adverse events from previous vaccinations. Dr. Patel also mentions that if Sarah plans to travel internationally again, she should request a new travel-specific ICVP that will be configured for offline verification at border crossings.

If the clinic's internet connection had been unavailable, the system would have indicated that online verification couldn't be completed and Dr. Patel would have performed a manual assessment, asking detailed questions about Sarah's vaccination history and making clinical decisions based on the available information while being more conservative in ruling out vaccine-preventable diseases.