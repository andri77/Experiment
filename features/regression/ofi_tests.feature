@regression
Feature: As a user I want to be able to create and modify my OFI

  @create-delete-ofi
  Scenario: As a Portplus user, I want to be able to create and delete OFI
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add an OFI
    And as a staff member, I select the first listed property
    And as a staff member, I assign an OFI to the property
    And as a staff member, I delete the OFI
