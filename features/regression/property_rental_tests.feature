@property @regression
Feature: As a user I want to be able to create and modify my rental property

  @create-multi-rental
  Scenario Outline: As a Portplus user, I want to be able to create rental properties
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add a property
    And as a staff member, I am able to create a "<Property Type>" rental for "<Property Action>" with the following:
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
  Examples:
    | Property Type | Property Action |
    | Residential   | For Rent        |
    | Rural         | For Rent        |

  @create-lease
  Scenario Outline: As a Portplus user, I want to be able to create lease properties
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add a property
    And as a staff member, I am able to create a "<Property Type>" lease for "<Property Action>" with the following:
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
  Examples:
    | Property Type | Property Action |
    | Commercial    | For Lease       |


