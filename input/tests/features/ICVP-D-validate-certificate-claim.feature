@ICVP-D @validation @decision-logic
Feature: Validate ICVP Certificate Claim
  As a status checking application
  I want to validate the claims within an ICVP certificate
  So that only authentic and compliant certificates are accepted

  Background:
    Given a certificate has been presented for verification
    And the status checking application is operational

  # QR Code Structural Validation
  Scenario: Valid QR code with HC1 prefix is accepted
    Given the QR code contains the HC1 prefix
    When the application validates the QR code format
    Then the format validation passes
    And the application proceeds to deserialization

  Scenario: QR code without HC1 prefix is rejected
    Given the QR code does not contain the HC1 prefix
    When the application validates the QR code format
    Then the format validation fails
    And the application rejects the certificate

  # Issuing Authority Trust Verification
  Scenario: Certificate from a trusted issuing authority
    Given the certificate was issued by a national health authority
    And the national health authority is registered in the WHO GDHCN trusted network
    When the application verifies the issuing authority
    Then the issuing authority is recognized as trusted

  Scenario: Certificate from an unrecognized issuing authority
    Given the certificate was issued by an authority not in the trusted network
    When the application verifies the issuing authority
    Then the issuing authority is not recognized
    And the certificate is rejected

  # Digital Signature Verification
  Scenario: Valid digital signature confirms certificate authenticity
    Given the issuing authority is trusted
    And the corresponding public key is available
    When the application verifies the digital signature
    Then the signature is valid
    And the certificate is confirmed as authentic
    And the certificate is confirmed as untampered

  Scenario: Invalid digital signature indicates tampering
    Given the issuing authority is trusted
    When the application verifies the digital signature
    And the signature does not match
    Then the certificate is rejected as potentially tampered

  # Certificate Type Determination
  Scenario: Offline certificate with embedded payload is identified
    Given the digital signature has been verified
    When the application inspects the certificate content
    And the certificate contains an embedded payload
    Then the certificate is classified as an offline certificate
    And vaccination data is extracted from the embedded payload

  Scenario: Online certificate with VHL is identified
    Given the digital signature has been verified
    When the application inspects the certificate content
    And the certificate contains a Verifiable Health Link (VHL)
    Then the certificate is classified as an online certificate
    And the application queries the external repository using the VHL

  # Data Element Validation
  Scenario: Required data elements are present
    Given the vaccination data has been extracted or retrieved
    When the application validates the data elements
    Then the holder's name is present
    And the holder's date of birth is present
    And the vaccine product ID is present
    And the vaccination date is present
    And the vaccine batch number is present

  Scenario: Missing required data element causes validation failure
    Given the vaccination data has been extracted or retrieved
    When a required data element is missing
    Then the application reports a data validation error
    And the certificate claim is not validated

  Scenario: Either clinician name or issuer must be present
    Given the vaccination data has been extracted or retrieved
    When neither the clinician name nor the issuer is present
    Then the application reports a validation error indicating missing authority

  # Certificate Validity Period
  Scenario: Certificate within its validity period
    Given the certificate has a valid-from date in the past
    And the certificate has a valid-until date in the future
    When the application checks the validity period
    Then the certificate is within its validity period

  Scenario: Expired certificate is flagged
    Given the certificate has a valid-until date in the past
    When the application checks the validity period
    Then the certificate has expired
    And the application flags the certificate as expired

  # Revocation Status
  Scenario: Certificate has not been revoked
    Given the certificate ID is checked against the certificate registry
    When the revocation status is queried
    And the certificate is not on the revocation list
    Then the certificate passes the revocation check

  Scenario: Revoked certificate is rejected
    Given the certificate ID is checked against the certificate registry
    When the revocation status is queried
    And the certificate is on the revocation list
    Then the certificate is rejected
    And the reason for revocation is displayed

  # Vaccination Business Rules
  Scenario Outline: Vaccination timing validation for travel
    Given the traveler received "<vaccine>" vaccination <days_before> days before arrival
    And the minimum required days before arrival is <min_days>
    When the application validates the vaccination timing
    Then the validation result is "<result>"

    Examples:
      | vaccine       | days_before | min_days | result  |
      | Yellow Fever  | 15          | 10       | Valid   |
      | Yellow Fever  | 10          | 10       | Valid   |
      | Yellow Fever  | 5           | 10       | Invalid |
      | Yellow Fever  | 0           | 10       | Invalid |

  Scenario: All destination-required vaccinations are present
    Given the destination country requires specific vaccinations
    And the certificate contains all required vaccinations
    When the application validates the vaccination requirements
    Then the vaccination requirements are met

  Scenario: Destination-required vaccination is missing
    Given the destination country requires specific vaccinations
    And the certificate is missing one or more required vaccinations
    When the application validates the vaccination requirements
    Then the vaccination requirements are not met
    And the application lists the missing vaccinations
