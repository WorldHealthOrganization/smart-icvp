@ICVP-D @generation @certificate
Feature: Generate Digital ICVP (ICVP.D)
  As a certificate generation service
  I want to generate and digitally sign an ICVP using validated vaccination data
  So that a valid digital ICVP is made available to the traveller

  Background:
    Given the Certificate Generation Service is operational
    And the service has access to the issuing authority's cryptographic keys

  # Scenario 1: Generate ICVP after point-of-care vaccination (Jessy)
  Scenario: Receive request for digital ICVP issuance from EIR
    Given Amina has completed entering vaccination data for Jessy in the EIR
    And all required data elements are complete
    When Amina initiates a request to issue a digital ICVP
    Then the request is sent to the Certificate Generation Service

  Scenario: Validate data completeness for ICVP generation
    Given the Certificate Generation Service receives a request for digital ICVP
    When the service validates the data received
    Then the service checks that all mandatory certificate fields are present
    And the service checks that fields are formatted correctly according to technical specifications

  Scenario: Generate and sign digital ICVP successfully
    Given the data is complete and valid
    When the Certificate Generation Service generates the digital ICVP
    Then the digital ICVP contains the required human-readable information
    And the digital ICVP contains a machine-readable QR code
    And a cryptographic signature is applied to ensure authenticity
    And the digital ICVP is made available

  Scenario: Notification of ICVP readiness
    Given the digital ICVP has been generated and signed
    When the ICVP is made available
    Then Amina receives a notification that the digital ICVP is ready
    And Jessy receives a secure notification enabling access to her digital ICVP

  Scenario: Review and deliver digital ICVP to traveller
    Given the digital ICVP is ready
    When Amina reviews the digital ICVP with Jessy
    Then Amina explains how it can be used for travel
    And Amina provides a printed copy for backup use during travel

  # Scenario 2: Generate ICVP from paper ICVP data (Rahul)
  Scenario: Generate digital ICVP from historical vaccination data
    Given Fatima has entered Rahul's paper ICVP data into the EIR
    And the data has been validated for completeness
    When the Certificate Generation Service generates the digital ICVP
    Then the digital ICVP is generated with validated vaccination data
    And a cryptographic signature is applied

  Scenario: Confirm digital ICVP matches original paper ICVP
    Given the digital ICVP has been generated for Rahul
    When Fatima reviews the digital ICVP with Rahul
    Then the information matches with the original paper ICVP
    And Rahul receives a notification enabling access to his digital ICVP
    And Fatima provides a printed copy in case of technical difficulties

  # Scenario 3: Generate ICVP via self-service portal (Ananya)
  Scenario: Generate digital ICVP from existing electronic record
    Given Ananya has authenticated on the national traveller portal
    And a valid electronic vaccination record is available
    When Ananya selects the option to request a digital ICVP for international travel
    Then the request is sent to the Certificate Generation Service
    And the service retrieves and validates the data for completeness
    And the digital ICVP is generated and made available through the traveller portal

  Scenario: Traveller downloads and saves digital ICVP
    Given the digital ICVP is available through the traveller portal
    When Ananya accesses the digital ICVP
    Then she reviews the information and confirms it is correct
    And she downloads the digital ICVP to her device
    And she prints a backup copy for inclusion with her travel documents

  # Error handling
  Scenario: Required data is missing or invalid
    Given the Certificate Generation Service receives a request
    When required data is missing or invalid
    Then the service generates an error indicating the digital ICVP cannot be created
    And the error message is returned to the requesting digital service
    And the requesting service may need to correct the data before retrying

  # Digital ICVP content validation
  Scenario: Digital ICVP contains all required data elements
    Given the Certificate Generation Service generates a digital ICVP
    Then the digital ICVP includes the traveller identifiers
    And the digital ICVP includes vaccination details
    And the digital ICVP includes the issuing authority
    And the digital ICVP includes the certificate valid from date
    And the digital ICVP includes the certificate valid until information
    And the digital ICVP includes the cryptographic signature of the issuer
    And the digital ICVP includes the key identifier for signature verification
    And the digital ICVP includes the version identifier
