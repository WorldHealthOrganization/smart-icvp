@ICVP-C @issuance @online
Feature: Issuing an Online ICVP for Continuity of Care
  As a certificate holder
  I want to request a digital ICVP configured for online verification
  So that healthcare providers can access my most current and comprehensive vaccination data

  Background:
    Given the holder is authenticated in the digital health wallet
    And the Electronic Immunization Registry (EIR) contains vaccination records for the holder

  Scenario: Holder requests an ICVP for continuity of care
    Given the holder's previously issued travel ICVP has expired
    And the holder navigates to the certificate services section
    When the holder requests the issuance of a new digital ICVP card
    Then the system prompts the holder to select the reason for certificate issuance

  Scenario: Holder selects continuity of care as the reason for issuance
    Given the holder has requested a digital ICVP card
    When the holder selects "Continuity of Care" as the reason for issuance
    Then the system explains that the certificate will be configured for online verification
    And the system explains that healthcare providers will access the most current vaccination data from authoritative sources
    And the system prompts the holder for consent

  Scenario: Holder provides consent for continuity of care certificate
    Given the holder has selected "Continuity of Care" as the reason for issuance
    When the holder reviews the information and provides consent
    Then the system records the consent authorization in the consent registry
    And the system begins collating ICVP data from the EIR

  Scenario: System retrieves vaccination records including recent updates
    Given the holder has provided consent for certificate issuance
    When the Certificate Issuance Service retrieves the holder's records
    Then the retrieved data includes the vaccine product ID
    And the retrieved data includes the vaccination dates
    And the retrieved data includes the vaccine batch numbers
    And the retrieved data includes the administering healthcare facility information
    And the retrieved data includes any recent updates to the immunization history

  Scenario: System configures certificate for online verification with VHL
    Given the holder selected "Continuity of Care" as the reason for issuance
    And the Certificate Issuance Service has retrieved the vaccination records
    When the system configures the certificate
    Then the certificate is configured for online verification
    And the system generates a Verifiable Health Link (VHL)
    And the VHL points to the holder's vaccination records stored in the national health system
    And the complete payload is not embedded in the certificate

  Scenario: System generates QR code with VHL
    Given the certificate is configured for online verification
    When the system generates the QR code
    Then the QR code contains the VHL
    And the QR code contains minimal identifying information
    And the QR code is digitally signed by the issuing health authority

  Scenario: Online ICVP is available in the digital health wallet
    Given the digital ICVP card has been issued for continuity of care
    Then the certificate is available in the holder's digital health wallet with a new validity period
    And the holder can view a basic vaccination summary
    And the holder can view the QR code

  Scenario: Online certificate differs from offline certificate
    Given a certificate is issued for "Travel" (offline)
    And a certificate is issued for "Continuity of Care" (online)
    Then the offline certificate embeds the complete payload in the QR code
    And the online certificate contains a VHL instead of the embedded payload
    And the online certificate enables real-time access to authoritative data
