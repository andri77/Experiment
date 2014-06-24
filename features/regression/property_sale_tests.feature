@property @regression
Feature: As a user I want to be able to create and modify my for sale and auction property

  @create-multi-property
  Scenario Outline: As a Portplus user, I want to be able to create For Sale properties
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add a property
    And as a staff member, I am able to create a "<Property Type>" property for "<Property Action>" with the following:
      | agent     | Tony Horn       |
      | street    | testing street  |
      | suburb    | Brighton        |
      | state     | VIC             |
      | postcode  | 3186            |
      | lowPrice  | 400000          |
      | highPrice | 500000          |
      | reaPrice  | 450000          |
    And as a staff member, I can "confirm" the property details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
    And as a staff member, I confirm my property is "active"
    Examples:
    | Property Type | Property Action |
    | Residential   | Sale            |
    | Commercial    | Sale            |
    | Business      | Sale            |
    | Rural         | Sale            |

  @create-multi-property @wip
  Scenario Outline: As a Portplus user, I want to be able to create for auction properties
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add a property
    And as a staff member, I am able to create a "<Property Type>" property for "<Property Action>" with the following:
      | agent     | Tony Horn       |
      | street    | testing street  |
      | suburb    | Brighton        |
      | state     | VIC             |
      | postcode  | 3186            |
      | lowPrice  | 400000          |
      | highPrice | 500000          |
      | reaPrice  | 450000          |
    And as a staff member, I can "confirm" the property details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
    And as a staff member, I confirm my property is "active"
  Examples:
    | Property Type | Property Action |
    | Residential   | Auction         |
    | Commercial    | Auction         |
    | Business      | Auction         |
    | Rural         | Auction         |


