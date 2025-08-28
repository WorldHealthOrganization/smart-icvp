Feature: Validate ICVPMin Structure

    Scenario: Verify the presence of mandatory fields in ICVPMin
        Given I have an ICVPMin structure
        When I validate its fields
        Then the structure should contain the following mandatory fields:
            | Field Name       |
            | id               |
            | name             |
            | dateOfBirth      |
            | vaccinationStatus|

    Scenario: Validate data types of fields in ICVPMin
        Given I have an ICVPMin structure
        When I check the data types of its fields
        Then the field "id" should be of type "String"
        And the field "name" should be of type "String"
        And the field "dateOfBirth" should be of type "Date"
        And the field "vaccinationStatus" should be of type "Boolean"

    Scenario: Ensure optional fields are handled correctly
        Given I have an ICVPMin structure
        When I validate its optional fields
        Then the structure should allow the field "notes" to be empty or of type "String"

    Scenario: Validate structure with missing mandatory fields
        Given I have an incomplete ICVPMin structure
        When I attempt to validate it
        Then the validation should fail with an error indicating the missing fields