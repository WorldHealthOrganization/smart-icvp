@ICVP-E @ascertainment @digital @verification
Feature: Digital Ascertainment of Validity and Authenticity of Digital ICVP (ICVP.E)
  As a border health inspector using a status checking application
  I want to digitally ascertain the validity and authenticity of a digital ICVP
  So that I can confirm the traveller's vaccination credentials meet entry requirements

  Background:
    Given the border health inspector has access to a status checking application
    And the application has trusted public keys available through the National PHA

  # Based on Scenario 4: Rahul at border with digital ICVP
  Scenario: Traveller presents digital ICVP at point of entry
    Given Rahul arrives in a country where proof of yellow fever vaccination is required under the IHR (2005)
    When Rahul presents his digital ICVP to Luis, a border health inspector
    Then Luis reviews the entry procedures requirements

  Scenario: Verify traveller identity against digital ICVP
    Given Rahul has presented his digital ICVP
    When Luis compares the demographic details on the digital ICVP with Rahul's passport
    Then the information matches
    And the digital ICVP is confirmed to belong to Rahul

  Scenario: Scan QR code using status checking application
    Given the traveller's identity has been confirmed
    When Luis scans the QR code displayed on the digital ICVP using the status checking application
    Then the application reads the static QR payload
    And the payload contains the encoded vaccination data and a cryptographic signature
    And the application retrieves and displays vaccination details

  Scenario: Display vaccination details from QR code
    Given the QR code has been successfully scanned
    When the application processes the QR payload
    Then the application displays the vaccine information
    And the application displays the date of vaccination
    And the application displays the issuing authority
    And the application displays the validity period

  Scenario: Check ICVP authenticity and revocation status
    Given the QR code data has been retrieved
    When the application begins the ascertainment process
    Then the application verifies the authenticity of the digital ICVP
    And the application checks the revocation status
    And using trusted public keys, it confirms the digital signature is valid
    And it confirms the certificate was issued by a trusted authority

  Scenario: Authenticity cannot be ascertained digitally
    Given the application has attempted to verify the digital ICVP
    When authenticity cannot be ascertained through QR code data validation
    Then the process continues through the non-digital ascertainment workflow (ICVP.F)

  Scenario: Check completeness of ICVP data
    Given the authenticity of the digital ICVP has been confirmed
    When the application checks that all required data elements are present
    Then the application validates data elements in accordance with the IHR (2005)
    And the application verifies the digital ICVP conforms to the Model ICVP in Annex 6
    And the application verifies that the vaccine corresponds to a WHO-approved product

  Scenario: ICVP data is incomplete
    Given the application has checked data completeness
    When required data elements are missing or incomplete
    Then the competent authority may take action in accordance with IHR and national procedures
    And actions may include assessing the traveller's vaccination status using available health records
    And where appropriate, administering the required vaccine and issuing a new ICVP

  Scenario: Check vaccination validity for yellow fever - valid (ICVP.DT.1 Rule 3)
    Given the digital ICVP data is complete
    And the vaccine is included in the WHO List of Prequalified Vaccines or EUL
    When the application evaluates vaccination validity
    And the vaccination was administered more than or equal to 10 days ago
    Then the application confirms the digital ICVP is valid

  Scenario: Check vaccination validity for yellow fever - too recent (ICVP.DT.1 Rule 2)
    Given the digital ICVP data is complete
    And the vaccine is included in the WHO List of Prequalified Vaccines or EUL
    When the application evaluates vaccination validity
    And the vaccination was administered less than 10 days ago
    Then the digital ICVP is not valid as vaccination occurred less than 10 days ago

  Scenario: Check vaccination validity - unapproved vaccine (ICVP.DT.1 Rule 1)
    Given the digital ICVP data is complete
    When the application evaluates vaccination validity
    And the vaccine is not included in the WHO List of Prequalified Vaccines or EUL
    Then the digital ICVP is not valid as vaccine or prophylaxis product is not approved by WHO
    And the State Party may take appropriate action

  Scenario: Digital ICVP contains inconsistencies or alterations
    Given the application has checked the ICVP data
    When the digital ICVP contains invalid amendments or inconsistencies
    Then the application flags the certificate as potentially invalid

  Scenario: Successful digital ascertainment - accept ICVP
    Given the digital ICVP authenticity has been confirmed
    And the ICVP data is complete
    And the vaccination validity criteria are met
    When the application displays confirmation
    Then the application indicates the digital ICVP is valid and authentic
    And Luis accepts the digital ICVP
    And Luis allows Rahul to proceed

  Scenario: Vaccination validity check for poliovirus - valid (ICVP.DT.2 Rule 2)
    Given the digital ICVP is for poliovirus vaccination
    And the vaccine is included in the WHO List of Prequalified Vaccines or EUL
    When the application evaluates vaccination validity
    Then the application confirms the digital ICVP is valid

  Scenario: Vaccination validity check for poliovirus - unapproved vaccine (ICVP.DT.2 Rule 1)
    Given the digital ICVP is for poliovirus vaccination
    And the vaccine is not included in the WHO List of Prequalified Vaccines or EUL
    When the application evaluates vaccination validity
    Then the digital ICVP is not valid as vaccine or prophylaxis product is not approved by WHO
