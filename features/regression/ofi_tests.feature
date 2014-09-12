@ofi
Feature: As a user I want to be able to create and delete my OFI

  @create-delete-ofi @smoke @regression
  Scenario: As a Portplus user, I want to be able to create and delete OFI
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add an OFI
    And as a staff member, I select the first listed property
    And as a staff member, I assign an OFI to the property
    And as a staff member, I delete the OFI

  @create-ofi
  Scenario: As a Portplus user, I want to be able to create and delete OFI
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add an OFI
    And as a staff member, I select the first listed property
    And as a staff member, I assign an OFI to the property

  @create-ofi-feedback @smoke @regression
  Scenario: As a Portplus user, I want to be able to create and delete OFI
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add an OFI Feedback
    And as a staff member, I select to add an OFI from feedback page
    And as a staff member, I select the first listed property
    And as a staff member, I assign an OFI to the property
    And as a staff member, I select the "Last 7 Days" tab
    And as a staff member, I select to add a buyer feedback
    And as a staff member, I fill in the OFI feedback form with the following:
      | fName     | Autobuy                  |
      | lName     | Agent                    |
      | mobile    | 0421211111               |
      | email     | autobuy@autotest.com     |
    And as a staff member, I can confirm that feedback is entered correctly with the following:
      | fName     | Autobuy                  |
      | lName     | Agent                    |
      | mobile    | 0421211111               |
      | email     | autobuy@autotest.com     |
      | address   | testing street, BRIGHTON |
      | agent     | Tony Horn                |
