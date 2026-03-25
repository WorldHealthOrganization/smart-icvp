@ICVP-B @vaccination @administration
Feature: Administer Vaccine and/or Prophylaxis (ICVP.B)
  As a vaccination provider
  I want to assess eligibility, safely administer required vaccines and monitor for adverse events
  So that the traveller receives appropriate vaccination for international travel

  Background:
    Given a traveller record has been registered in the EIR
    And the traveller requires vaccination for international travel

  # Based on Scenario 1: Jessy at point of care
  Scenario: Check contraindications before vaccination
    Given Jessy has been registered as a new traveller
    When Amina reviews Jessy's vaccination history and travel destination
    And Amina conducts a clinical assessment to identify potential contraindications
    Then the assessment determines whether Jessy is eligible for vaccination

  Scenario: Traveller is eligible for vaccination
    Given Jessy does not have any contraindications
    When the clinical assessment is complete
    Then Jessy is determined to be eligible for yellow fever vaccination

  Scenario: Traveller is not eligible due to contraindications
    Given the traveller has medical contraindications to the vaccine
    When the vaccination provider determines ineligibility
    Then the vaccination provider explains the reason for ineligibility
    And provides guidance on alternative options
    And may inform about the possibility of obtaining a medical exemption under the IHR

  Scenario: Check vaccine stock availability
    Given the traveller is eligible for vaccination
    When Amina checks the clinic's vaccine stock
    Then she confirms that yellow fever vaccine is available
    And the vaccine is not expired
    And the vaccine vial monitor shows proper storage temperature

  Scenario: Counsel traveller on vaccination
    Given the vaccine is available
    When Amina provides counselling on the vaccination
    Then the counselling includes the purpose of the vaccination
    And the counselling includes possible side effects
    And the traveller's informed consent is obtained

  Scenario: Prepare and administer vaccine
    Given the traveller has provided informed consent
    When Amina prepares the yellow fever vaccine
    And administers the vaccine according to guidelines
    Then the vaccine is successfully administered
    And waste disposal, adverse reaction monitoring and data entry can begin

  Scenario: Monitor for adverse reactions after administration
    Given the vaccine has been administered to Jessy
    When Amina monitors Jessy for adverse reactions
    And no adverse reaction is observed
    Then monitoring is complete and the process continues

  Scenario: Adverse reaction is observed
    Given the vaccine has been administered
    When the traveller exhibits an immediate adverse reaction
    Then the vaccination provider treats the reaction as appropriate
    And reports the AEFI per national policies and reporting mechanisms

  Scenario: Determine follow-up after vaccination
    Given the vaccine has been administered successfully
    When the vaccination provider assesses follow-up needs
    Then additional vaccine doses or follow-up visits are determined if required
    And the traveller is informed about recommended schedules for future doses
