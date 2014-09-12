@property_rental
Feature: As a user I want to be able to create and modify my rental property

  @create-multi-rental @regression
  Scenario: As a Portplus user, I want to be able to create rental properties
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add a property
    And as a staff member, I am able to create a "Residential" rental "For Rent" with the following:
      | agent     | Tony Horn       |
      | street    | testing street  |
      | suburb    | Brighton        |
      | state     | VIC             |
      | postcode  | 3186            |
      | weekly    | 400             |
      | monthly   | 1733.33         |
      | bond      | 500             |
      | display   | $400 per week   |
      | bedrooms  | 3               |
      | bathrooms | 2               |
      | garages   | 2               |
      | carports  | 1               |
    And as a staff member, I can "confirm" the property details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
    And as a staff member, I confirm my property is "active"

  @create-multi-rental @regression
  Scenario: As a Portplus user, I want to be able to create rental properties
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add a property
    And as a staff member, I am able to create a "Rural" rental "For Rent" with the following:
      | agent     | Tony Horn       |
      | street    | testing street  |
      | suburb    | Brighton        |
      | state     | VIC             |
      | postcode  | 3186            |
      | weekly    | 400             |
      | monthly   | 1733.33         |
      | bond      | 500             |
      | display   | $400 per week   |
    And as a staff member, I can "confirm" the property details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
    And as a staff member, I confirm my property is "active"

  @create-lease @smoke @regression
  Scenario: As a Portplus user, I want to be able to create lease properties
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add a property
    And as a staff member, I am able to create a "Commercial" lease "For Lease" with the following:
      | agent     | Tony Horn       |
      | street    | testing street  |
      | suburb    | Brighton        |
      | state     | VIC             |
      | postcode  | 3186            |
      | lease     | 600             |
    And as a staff member, I can "confirm" the property details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
    And as a staff member, I confirm my property is "active"


