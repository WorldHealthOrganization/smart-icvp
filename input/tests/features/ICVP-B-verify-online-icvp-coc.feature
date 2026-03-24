@ICVP-B @verification @online @continuity-of-care
Feature: Verifying an Online ICVP for Continuity of Care
  As a healthcare provider
  I want to verify a patient's digital ICVP at a healthcare facility
  So that I can access their complete and current vaccination history for clinical decision-making

  Background:
    Given the healthcare provider has access to a health information system with an ICVP verification module
    And the patient holds a digital ICVP configured for online verification
    And the healthcare facility has internet connectivity

  Scenario: Healthcare provider scans the patient's ICVP QR code
    Given the patient presents their digital ICVP QR code for continuity of care
    And the patient consents to verification of the certificate details
    When the healthcare provider scans the QR code using the system's scanner
    Then the application initiates the online verification process

  Scenario: QR code format validation for online certificate
    Given the healthcare provider has scanned the patient's QR code
    When the application validates the QR code
    Then the application checks for the correct HC1 prefix format
    And the application deserializes the data
    And the application identifies the Verifiable Health Link (VHL)
    And the application identifies the key ID and issuing authority information

  Scenario: Issuing authority verification for online certificate
    Given the QR code has been successfully deserialized
    When the application checks the issuing authority
    Then the application verifies whether the issuing authority is recognized in the trusted network
    And the application fetches the corresponding public key from the trust network gateway or local cache

  Scenario: Digital signature verification on VHL
    Given the issuing authority is recognized in the trusted network
    And the public key has been fetched
    When the application verifies the digital signature
    Then the signature verification confirms the VHL is authentic
    And the signature verification confirms the VHL has not been tampered with

  Scenario: System queries the National PHA using VHL
    Given the digital signature has been successfully verified
    And the certificate is identified as an online certificate containing a VHL
    When the application uses the VHL to send a secure query
    Then the query is sent to the issuing country's Public Health Authority certificate repository
    And the query requests the patient's complete and current vaccination details

  Scenario: National PHA processes the verification request
    Given the National PHA receives the verification request
    When the National PHA processes the request
    Then the National PHA authenticates the requesting system
    And the National PHA identifies the patient's certificate in the certificate registry
    And the National PHA retrieves the complete and most up-to-date record from the certificate repository
    And the National PHA returns the comprehensive vaccination data to the verification application

  Scenario: Business rule validation for online certificate
    Given the vaccination data has been received from the National PHA
    When the application applies business rules
    Then the application checks the vaccination dates and types
    And the application confirms the certificate has not been revoked
    And the application verifies that the data is current

  Scenario: Revoked certificate is rejected
    Given the vaccination data has been received from the National PHA
    When the application checks the certificate status
    And the certificate has been revoked
    Then the application rejects the certificate claim
    And the application displays a revocation notice

  Scenario: Successful online verification displays comprehensive details
    Given all business rules have been satisfied
    When the verification is complete
    Then the application displays a "Valid" status
    And the application displays the vaccination details retrieved in real-time
    And the details include the vaccine product name and manufacturer
    And the details include the vaccination date
    And the details include the batch number
    And the details include the administering facility
    And the details include any documented adverse reactions

  Scenario: Clinical decision support from verified vaccination data
    Given the verification displays that Yellow Fever vaccination was administered 45 days ago
    When the healthcare provider reviews the information
    Then the provider can determine that Yellow Fever is ruled out as a cause of current symptoms
    And the incubation period has passed
    And the patient is confirmed as protected

  Scenario: Import verified ICVP data to local electronic health record
    Given the ICVP has been successfully verified
    And the patient provides consent for data import
    When the healthcare provider uses the import function
    Then the verified ICVP data is added to the patient's local electronic health record
    And the patient's complete vaccination history becomes part of their permanent medical record

  Scenario: System identifies immunization gaps after import
    Given the verified ICVP data has been imported to the local EHR
    When the system compares the imported data against national immunization schedules
    Then the system automatically identifies any gaps in routine immunizations
    And the system flags vaccinations that are due

  Scenario: Tetanus booster gap identified
    Given the verified ICVP data has been imported to the local EHR
    When the system identifies immunization gaps
    Then the system flags that the patient is due for a tetanus booster

  Scenario: Online verification fails when internet is unavailable
    Given the healthcare facility has no internet connectivity
    When the healthcare provider attempts to verify an online ICVP
    Then the system indicates that online verification could not be completed
    And the healthcare provider must perform a manual assessment

  Scenario: Manual assessment fallback when online verification fails
    Given online verification could not be completed due to lack of connectivity
    When the healthcare provider performs a manual assessment
    Then the provider asks detailed questions about the patient's vaccination history
    And the provider makes clinical decisions based on available information
    And the provider is more conservative in ruling out vaccine-preventable diseases

  Scenario: Healthcare provider counsels patient on ICVP management
    Given the clinical assessment is complete
    When the healthcare provider counsels the patient
    Then the provider advises maintaining the digital ICVP
    And the provider explains the continuity of care certificate provides current information
    And the provider schedules any recommended vaccinations
    And the provider advises requesting a travel-specific ICVP for future international travel
    And the provider advises reporting any delayed adverse events from previous vaccinations
