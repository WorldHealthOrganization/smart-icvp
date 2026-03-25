@ICVP-F @ascertainment @non-digital @visual-inspection
Feature: Non-digital Ascertainment of Validity and Authenticity of Digital ICVP (ICVP.F)
  As a border health inspector without access to a status checking application
  I want to ascertain the validity and authenticity of a digital ICVP through visual inspection
  So that I can determine whether the traveller's ICVP meets entry requirements

  Background:
    Given the border health inspector does not have access to a status checking application
    And the traveller presents a digital ICVP at a point of entry

  # Based on Scenario 5: Jessy - non-digital ascertainment via NFP
  Scenario: Traveller presents digital ICVP for visual inspection
    Given Jessy arrives in a country where proof of yellow fever vaccination is required under the IHR (2005)
    When Jessy presents her digital ICVP to Alex, a border health inspector
    Then Alex begins the non-digital ascertainment process

  Scenario: Verify traveller identity against digital ICVP
    Given Alex has received Jessy's digital ICVP
    When Alex compares the demographic details on the digital ICVP with her passport
    Then the information matches
    And the digital ICVP is confirmed to correspond to Jessy

  Scenario: Visual inspection of digital ICVP
    Given Jessy's identity has been confirmed
    When Alex visually inspects the digital ICVP
    Then Alex reviews the human-readable information including name, date of birth, nationality
    And Alex reviews the vaccine details, date of vaccination, issuing authority and validity period

  Scenario: Assess authenticity based on document and issuing authority
    Given Alex has reviewed the human-readable information
    When Alex checks whether authenticity can be ascertained through visual inspection
    And the format of the issuing authority information is different from what is typically observed
    Then Alex is unable to confidently ascertain authenticity through visual inspection

  Scenario: Authenticity ascertainable through visual inspection
    Given the border health inspector has reviewed the digital ICVP
    When the digital ICVP format and issuing authority are recognizable
    Then authenticity is reasonably established through visual inspection
    And the inspector proceeds to check data completeness

  Scenario: Request ascertainment of authenticity from issuing State Party
    Given Alex cannot ascertain authenticity through visual inspection
    When Alex initiates a request for ascertainment of authenticity
    Then the request is sent through national channels to the national IHR focal point
    And the focal point contacts the relevant authority in the issuing State Party
    And the relevant authority checks their internal databases

  Scenario: Issuing State Party confirms authenticity
    Given a request for ascertainment of authenticity has been sent
    When the issuing State Party verifies the digital ICVP
    Then a response is received confirming the digital ICVP is authentic
    And it was issued by a recognized authority

  Scenario: Issuing State Party cannot confirm authenticity
    Given a request for ascertainment of authenticity has been sent
    When the issuing State Party cannot verify the digital ICVP
    Then the digital ICVP is considered non-authentic
    And the competent authority may take action in accordance with IHR and national procedures

  Scenario: Check completeness of ICVP data through visual inspection
    Given the authenticity of the digital ICVP has been established
    When Alex visually inspects the digital ICVP for data completeness
    Then he confirms the digital ICVP conforms to the Model ICVP in Annex 6
    And the three required sections are present: holder information, vaccinations, and validity information
    And the vaccine corresponds to a WHO-approved product

  Scenario: Check vaccination validity through visual inspection
    Given the ICVP data is complete
    When Alex checks the vaccination validity
    Then he verifies the digital ICVP does not contain invalid amendments or inconsistencies
    And confirms the "certificate valid from ... until ..." period is in effect
    And the vaccination was administered more than 10 days ago for yellow fever

  Scenario: Accept ICVP after non-digital ascertainment - via NFP
    Given Alex has confirmed both validity and authenticity through the NFP process
    When the digital ICVP conforms to the required format, is duly completed, and is in effect
    Then Alex accepts the digital ICVP
    And allows Jessy to proceed

  # Based on Scenario 6: Ananya - non-digital ascertainment via national verification portal
  Scenario: Traveller presents printed digital ICVP
    Given Ananya arrives in a country where proof of yellow fever vaccination is required
    When Ananya presents a printed version of her digital ICVP to Ali, a border health inspector
    Then Ali begins the non-digital ascertainment process

  Scenario: Visual inspection of printed digital ICVP
    Given Ali has confirmed Ananya's identity against her passport
    When Ali visually inspects the printed digital ICVP
    And the issuing authority is not familiar and cannot be verified from the displayed information
    Then Ali is unable to confidently ascertain authenticity through visual inspection

  Scenario: Verify authenticity using national verification portal
    Given Ali cannot ascertain authenticity through visual inspection
    When Ali accesses a verification portal operated by the PHA that issued Ananya's ICVP
    And enters key details including the document ID and traveller information
    Then the portal queries official vaccination records in the EIR of the issuing State Party
    And retrieves the corresponding vaccination record

  Scenario: National verification portal confirms authenticity
    Given the verification portal has processed Ali's query
    When the portal returns a confirmation
    Then the confirmation indicates the vaccination record is valid
    And the digital ICVP was issued by an authorized issuer

  Scenario: Accept ICVP after portal verification
    Given Ali has received confirmation from the verification portal
    When both validity and authenticity have been ascertained
    Then Ali accepts the digital ICVP
    And allows Ananya to proceed

  Scenario: Take action for invalid or non-authentic ICVP
    Given the digital ICVP is identified as invalid or non-authentic
    When the competent authority determines appropriate actions
    Then actions may include assessing the traveller's vaccination status using available health records
    And where appropriate, administering the required vaccine and issuing a new ICVP
    And additional measures related to specific diseases may apply in accordance with Annex 7
