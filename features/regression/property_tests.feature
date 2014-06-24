@property @regression
Feature: As a user I want to be able to create and modify my property

  @create-withdraw-property
  Scenario: As a Portplus user, I want to be able to create a new client
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add a property
    And as a staff member, I am able to create a residential property with the following:
      | agent     | Tony Horn       |
      | street    | testing street  |
      | suburb    | Brighton        |
      | state     | VIC             |
      | postcode  | 3186            |
      | lowPrice  | 400000          |
      | highPrice | 500000          |
      | reaPrice  | 450000          |
    And as a staff member, I apply business rules to the property
    And as a staff member, I can "confirm" the property details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
    And as a staff member, I confirm my property is "active"
    And as a staff member, I am able to withdraw my property
    And as a staff member, I confirm my property is "withdrawn"

  @edit-property
  Scenario: As a Portplus user, I want to be able to create a new client
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And I select the first property on white board
    And as a staff member, I can "edit" the property details with the following:
      | street     | suburb   | state | postcode  | bedrooms | bathrooms |
      | qa street  | Sydney   | NSW   | 2000      | 2        | 5         |
    And as a staff member, I can "confirm" the property details with the following:
      | street     | suburb   | state | postcode  | bedrooms | bathrooms |
      | qa street  | Sydney   | NSW   | 2000      | 2        | 5         |

  @create-appraisal @wip
  Scenario: As a Portplus user, I want to be able to create an appraisal
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I am able to create an appraisal
#      | agent     | Tony Horn       |
#      | street    | testing street  |
#      | suburb    | Brighton        |
#      | state     | VIC             |
#      | postcode  | 3186            |
#      | lowPrice  | 400000          |
#      | highPrice | 500000          |
#      | reaPrice  | 450000          |
##    Then I attach my property image
#    And as a staff member, I apply business rules to the property
#    And as a staff member, I can "confirm" the property details with the following:
#      | street             | suburb    |
#      | testing street     | BRIGHTON  |

