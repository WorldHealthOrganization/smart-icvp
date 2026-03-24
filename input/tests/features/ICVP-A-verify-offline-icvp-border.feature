@ICVP-A @verification @offline @border
Feature: Verifying an Offline ICVP at the Border
  As a border health official
  I want to verify a traveler's digital ICVP presented at the border
  So that I can confirm their vaccination credentials meet entry requirements without internet connectivity

  Background:
    Given the border health official has access to a status checking application
    And the status checking application has locally cached public keys from the trusted issuers network
    And the traveler holds a digital ICVP configured for offline verification

  Scenario: Border official scans the ICVP QR code
    Given the traveler presents their digital ICVP QR code
    When the border official scans the QR code using the status checking application
    Then the application initiates the verification process

  Scenario: QR code format validation
    Given the border official has scanned the traveler's QR code
    When the application validates the QR code
    Then the application checks for the correct HC1 prefix format
    And the application deserializes the data
    And the application identifies the key ID and issuing authority information

  Scenario: QR code with invalid format is rejected
    Given the border official has scanned a QR code
    When the QR code does not have the HC1 prefix
    Then the application rejects the QR code
    And the application displays an error indicating invalid certificate format

  Scenario: Issuing authority verification against trusted network
    Given the QR code has been successfully deserialized
    When the application checks the issuing authority
    Then the application verifies whether the issuing authority is recognized in the trusted network of certificate issuers

  Scenario: Untrusted issuing authority is rejected
    Given the QR code has been deserialized
    When the issuing authority is not recognized in the trusted network
    Then the application rejects the certificate
    And the application displays an error indicating the issuing authority is not trusted

  Scenario: Digital signature verification using locally cached public key
    Given the issuing authority is recognized in the trusted network
    When the application verifies the digital signature
    Then the application fetches the corresponding public key from its local cache
    And the application does not require internet connectivity
    And the signature verification confirms the certificate has not been tampered with
    And the signature verification confirms the certificate was genuinely issued by the claimed authority

  Scenario: Invalid digital signature is rejected
    Given the issuing authority is recognized in the trusted network
    When the digital signature verification fails
    Then the application rejects the certificate
    And the application displays an error indicating the certificate signature is invalid

  Scenario: Extraction of vaccination data from embedded payload
    Given the digital signature has been successfully verified
    And the certificate is identified as an offline certificate
    When the application extracts the vaccination data
    Then the data is extracted directly from the embedded payload
    And no external system queries are required

  Scenario: Business rule validation - Yellow Fever vaccination timing
    Given the vaccination data has been extracted from the certificate
    When the application applies business rules
    Then the application checks that the Yellow Fever vaccination was administered at least 10 days before arrival

  Scenario: Yellow Fever vaccination administered less than 10 days before arrival
    Given the traveler's Yellow Fever vaccination was administered less than 10 days before arrival
    When the application applies business rules
    Then the application rejects the certificate claim
    And the application indicates the vaccination was administered too recently

  Scenario: Business rule validation - vaccine expiry
    Given the vaccination data has been extracted from the certificate
    When the application applies business rules
    Then the application checks that the vaccine has not expired

  Scenario: Expired vaccine is flagged
    Given the traveler's vaccine has expired
    When the application applies business rules
    Then the application rejects the certificate claim
    And the application indicates the vaccine has expired

  Scenario: Business rule validation - required vaccinations for destination
    Given the vaccination data has been extracted from the certificate
    When the application applies business rules
    Then the application checks that all required vaccinations for the destination country are present

  Scenario: Missing required vaccination for destination
    Given the traveler is missing a required vaccination for the destination country
    When the application applies business rules
    Then the application rejects the certificate claim
    And the application indicates which required vaccinations are missing

  Scenario: Successful offline verification displays valid status
    Given all business rules have been satisfied
    When the verification is complete
    Then the application displays a "Valid" status
    And the application displays the traveler's name
    And the application displays the vaccination details with dates and vaccine types
    And the application indicates this was an offline verification

  Scenario: Verification event is logged locally
    Given the verification has been completed
    When the result is displayed to the border official
    Then the system logs the verification event locally on the device
    And the log includes the date and time
    And the log includes the certificate ID
    And the log includes the verification outcome

  Scenario: Verification logs are synchronized when connectivity is restored
    Given verification events have been logged locally
    When internet connectivity is restored
    Then the logs are synchronized with the border health surveillance system
    And the synchronization supports public health monitoring purposes

  Scenario: Offline verification works without internet connectivity
    Given the status checking application has no internet connectivity
    And the public keys are available in the local cache
    When the border official verifies a traveler's ICVP
    Then the verification completes successfully using only locally available data
