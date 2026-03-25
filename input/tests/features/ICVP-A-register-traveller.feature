@ICVP-A @registration @traveller
Feature: Register Traveller (ICVP.A)
  As a vaccination provider or issuing authority
  I want to create, retrieve or update a traveller record
  So that vaccination events can be linked to support ICVP issuance

  Background:
    Given the vaccination provider has access to the Electronic Immunization Registry (EIR)
    And the EIR supports searching, creating and updating traveller records

  # Scenario 1: New traveller with no prior history (Jessy)
  Scenario: Gather traveller details for a new traveller
    Given Jessy is a 28-year-old preparing for international travel
    And she visits a travel clinic authorized to administer vaccines and issue ICVP
    When Amina, the health worker, collects Jessy's identifying information
    Then the EIR records her name, date of birth and sex

  Scenario: Search for existing traveller record
    Given Amina has collected Jessy's demographic information
    When Amina searches the EIR using name, date of birth and sex
    Then the EIR returns a list of potential matching records or indicates no match found

  Scenario: No existing record found for new traveller
    Given Amina has searched the EIR for Jessy
    And no existing record is found
    When Amina creates a new traveller record
    Then the EIR generates a new traveller record for Jessy
    And a unique identifier is assigned to the record

  Scenario: Verify traveller identity using passport
    Given a traveller record has been created or located for Jessy
    When Amina requests Jessy's passport
    Then Amina verifies that the name and date of birth match the EIR record
    And with Jessy's consent, the passport is recorded as the national identification document
    And the identification number is included in the record

  # Scenario 2: Returning traveller with paper ICVP (Rahul)
  Scenario: Search for existing traveller record for returning traveller
    Given Rahul is a 34-year-old with an existing paper ICVP
    And he visits a travel clinic to obtain a digital ICVP
    When Fatima searches the EIR using Rahul's demographic information
    Then the EIR returns potential matching records

  Scenario: Verify and confirm existing traveller record
    Given a possible match is found in the EIR for Rahul
    When Fatima verifies Rahul's passport against the record
    And the name and date of birth match
    Then the traveller record is confirmed as belonging to Rahul

  Scenario: Review and update traveller details
    Given Rahul's traveller record has been confirmed
    When Fatima reviews the demographic details with Rahul
    Then any outdated information is updated
    And the record is accurate and up to date

  # Scenario 3: Self-service registration (Ananya)
  Scenario: Traveller accesses national portal with digital identity
    Given Ananya is a 27-year-old preparing for international travel
    And her country provides a national traveller portal
    When Ananya accesses the portal using her phone
    And authenticates using her national digital identity credentials
    Then the portal retrieves her demographic information and vaccination history

  # General validation rules
  Scenario: Traveller record requires mandatory data elements
    Given the vaccination provider is creating a new traveller record
    When the provider enters the traveller's information
    Then the EIR requires the name of the recipient of vaccine or prophylaxis
    And the EIR requires the date of birth
    And the EIR requires the sex
    And the EIR requires the nationality

  Scenario: Duplicate record prevention
    Given the vaccination provider is searching for a traveller record
    When a possible match is found in the EIR
    Then the provider reviews the possible matches to determine whether a record already exists
    And searching before creating is considered best practice to prevent duplicate records
