@ICVP-C @issuance @offline
Feature: Issuing an Offline ICVP for Travel
  As a certificate holder
  I want to request a digital ICVP configured for offline verification
  So that my vaccination credentials can be verified at border crossings without internet connectivity

  Background:
    Given the holder is authenticated in the digital health wallet
    And the Electronic Immunization Registry (EIR) contains vaccination records for the holder

  Scenario: Holder requests an offline ICVP for travel
    Given the holder navigates to the certificate services section
    When the holder requests the issuance of a digital ICVP card
    Then the system displays information about the digitization process
    And the system prompts the holder to select the reason for certificate issuance
    And the available options include "Travel", "Continuity of Care", and "Personal Records"

  Scenario: Holder selects travel as the reason for issuance
    Given the holder has requested a digital ICVP card
    When the holder selects "Travel" as the reason for issuance
    Then the system explains how the holder's data will be used and stored
    And the system prompts the holder for consent to create a digital version of vaccination records

  Scenario: Holder provides consent for certificate issuance
    Given the holder has selected "Travel" as the reason for issuance
    When the holder reviews the information and provides consent
    Then the system records the consent authorization in the consent registry
    And the system begins collating ICVP data from the EIR

  Scenario: System retrieves vaccination records from EIR
    Given the holder has provided consent for certificate issuance
    When the Certificate Issuance Service retrieves the holder's records
    Then the retrieved data includes the vaccine product ID
    And the retrieved data includes the vaccination dates
    And the retrieved data includes the vaccine batch numbers
    And the retrieved data includes the administering healthcare facility information

  Scenario: System configures certificate for offline verification
    Given the holder selected "Travel" as the reason for issuance
    And the Certificate Issuance Service has retrieved the vaccination records
    When the system configures the certificate
    Then the certificate is configured for offline verification
    And the complete ICVP payload is embedded directly into the certificate
    And the embedded payload includes vaccination details
    And the embedded payload includes demographic information
    And the embedded payload includes certificate metadata

  Scenario: System generates a digitally signed QR code
    Given the certificate is configured for offline verification
    When the system generates the QR code
    Then the QR code contains the embedded ICVP payload
    And the QR code is digitally signed by the issuing health authority

  Scenario: Issued ICVP contains all required data elements
    Given the digital ICVP card has been issued
    Then the certificate includes the holder's name
    And the certificate includes the holder's date of birth
    And the certificate includes the vaccine product ID from the WHO PreQual Database
    And the certificate includes the vaccination dates
    And the certificate includes the vaccine batch numbers
    And the certificate includes the administering facility information
    And the certificate includes a unique certificate identifier
    And the certificate includes the certificate validity period
    And the certificate includes the digital signature

  Scenario: Issued ICVP includes optional demographic data when available
    Given the EIR contains optional demographic data for the holder
    When the digital ICVP card is issued
    Then the certificate includes the holder's sex if available
    And the certificate includes the holder's nationality if available
    And the certificate includes the national identification document if available
    And the certificate includes the guardian name if applicable

  Scenario: Offline ICVP is available in the digital health wallet
    Given the digital ICVP card has been issued
    Then the certificate is available in the holder's digital health wallet
    And the holder can view the vaccination details
    And the holder can view the QR code for presentation at borders
    And all verification data is contained within the QR code itself

  Scenario: Consent must be obtained before certificate generation
    Given the holder has not yet provided consent
    When the system attempts to generate the certificate
    Then the certificate is not generated
    And the system prompts the holder to provide consent

  Scenario: Certificate issuance requires either clinician name or issuer
    Given the vaccination record has neither a clinician name nor an issuer
    When the system attempts to generate the certificate
    Then the system reports a validation error
    And the certificate is not generated

  Scenario: Name validation on certificate
    Given the holder's name contains only letters and special characters (period, dash)
    When the system generates the certificate
    Then the name is accepted as valid

  Scenario: Date of birth validation on certificate
    Given the holder's date of birth is provided
    When the system validates the date of birth
    Then the date of birth must be less than or equal to the current date
