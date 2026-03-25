@ICVP-C @vaccination-data @EIR
Feature: Enter Vaccination Data in EIR (ICVP.C)
  As a vaccination provider or issuing authority
  I want to review vaccination information and record it in the EIR
  So that the data supports digital ICVP issuance

  Background:
    Given the vaccination provider has access to the Electronic Immunization Registry (EIR)
    And a traveller record exists in the EIR

  # Scenario 1: Data entry after point-of-care vaccination (Jessy)
  Scenario: Enter vaccination data after administering vaccine
    Given Amina has administered the yellow fever vaccine to Jessy
    When Amina enters the vaccination data in the EIR
    Then the recorded information includes the vaccine or prophylaxis product
    And the recorded information includes the batch number
    And the recorded information includes the date of administration
    And the recorded information includes the name of supervising clinician or issuing authority

  Scenario: EIR auto-derives related data elements
    Given Amina has entered the vaccine or prophylaxis product in the EIR
    When the EIR processes the vaccine product entry
    Then the EIR automatically derives and populates the name of disease
    And the EIR automatically derives and populates the manufacturer

  Scenario: Validate data completeness before ICVP request
    Given all vaccination data has been entered in the EIR
    When Amina reviews the data for completeness
    Then all required data elements are confirmed complete
    And Amina can initiate a request to issue a digital ICVP

  # Scenario 2: Data entry from paper ICVP (Rahul)
  Scenario: Review paper ICVP for validity
    Given Rahul presents a paper ICVP ("yellow card") to Fatima
    When Fatima performs a visual inspection of the paper ICVP
    Then she confirms the clinician's signature with wet ink is present
    And the official stamp of the vaccination center is present
    And the date of vaccination is recorded
    And all required fields are completed
    And the recorded vaccine corresponds to a WHO-approved yellow fever vaccine

  Scenario: Paper ICVP meets ICVP requirements
    Given Fatima has reviewed Rahul's paper ICVP
    And all required information is legible and complete
    When Fatima determines whether the vaccination record meets digital ICVP requirements
    Then the paper ICVP is accepted for digital ICVP issuance

  Scenario: Enter historical vaccination data from paper ICVP
    Given the paper ICVP has been accepted for digital ICVP issuance
    When Fatima enters the vaccination information from the paper ICVP into the EIR
    Then the data is recorded as a historical vaccination record
    And the vaccination data includes the vaccine product
    And the vaccination data includes the batch number
    And the vaccination data includes the date of administration
    And the vaccination data includes the name of supervising clinician or issuing authority
    And the EIR automatically derives and populates related data elements

  Scenario: Verify entered data matches paper ICVP
    Given vaccination data has been entered from the paper ICVP
    When Fatima reviews the entered information
    Then the entered information accurately reflects the paper certificate

  Scenario: Paper ICVP does not meet requirements
    Given the traveller presents a vaccination record
    When the vaccination provider determines the record does not meet ICVP requirements
    Then the traveller is informed that the record cannot be accepted for digital ICVP issuance
    And the provider advises on possible next steps
    And next steps may include receiving a new vaccination or providing additional documentation

  # Data element validation
  Scenario: Required data elements for vaccination entry
    Given the vaccination provider is entering vaccination data
    When the data is submitted to the EIR
    Then the EIR requires the vaccine or prophylaxis product
    And the EIR requires the name of disease or condition
    And the EIR requires the date of administration
    And the EIR requires the batch number of vaccine or prophylaxis
    And the EIR requires the manufacturer of vaccine or prophylaxis
