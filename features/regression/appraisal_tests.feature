@appraisal-tests
Feature: As a user I want to be able to create and modify my property

  @create-appraisal
  Scenario: As a Portplus user, I want to be able to create an appraisal
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I am able to create an appraisal
    And as a staff member, I am able to create an appraisal with the following:
      | agent     | Tony Horn       |
      | street    | testing street  |
      | suburb    | Brighton        |
      | state     | VIC             |
      | postcode  | 3186            |
      | agent_min_price | 400000    |
      | agent_max_price | 500000    |
      | client_min_price  | 450000  |
      | client_max_price | 600000   |
      | land_size | 500             |
      | land_rates| 700             |
      | bedrooms  | 4               |
      | bathrooms | 3               |
      | priority  | Medium          |
      | fName     | Auto            |
      | lName     | Run             |
    And as a staff member, I apply business rules to the appraisal
    And as a staff member, I confirm the appraisal status to "Prospective"
    And as a staff member, I confirm my appraisal is "Active"


  @smoke @regression @appraisal
  Scenario: As a Portplus user, I want to be able to create an appraisal
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I am able to create an appraisal
    And as a staff member, I am able to create an appraisal with the following:
      | agent     | Tony Horn       |
      | street    | testing street  |
      | suburb    | Brighton        |
      | state     | VIC             |
      | postcode  | 3186            |
      | agent_min_price | 400000    |
      | agent_max_price | 500000    |
      | client_min_price  | 450000  |
      | client_max_price | 600000   |
      | land_size | 500             |
      | land_rates| 700             |
      | bedrooms  | 4               |
      | bathrooms | 3               |
      | priority  | Medium          |
      | fName     | Auto            |
      | lName     | Run             |
    And as a staff member, I apply business rules to the appraisal
#    And I take a screenshot off the "image_upload" page and save it at "./features/screenshots/"
#    Then I compare the screenshots for "image_upload" page
    And as a staff member, I can "edit" the appraisal details with the following:
      | street     | suburb   | state | postcode  | bedrooms | bathrooms |
      | qa street  | Sydney   | NSW   | 2000      | 2        | 5         |
    And as a staff member, I can "confirm" the appraisal details with the following:
      | street        | suburb    |
      | qa street     | BRIGHTON  |
    And as a staff member, I confirm the appraisal status to "Prospective"
    And as a staff member, I confirm my appraisal is "Active"
    And as a staff member, I change the appraisal status to "Sold"
    And as a staff member, I confirm the appraisal status to "Sold"

  @appraisal2 @regression
  Scenario Outline: As a Portplus user, I want to be able to create an appraisal
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I am able to create an appraisal for "<Property Type>" property for "<Property Action>" with the following:
      | agent     | Tony Horn       |
      | street    | testing street  |
      | suburb    | Brighton        |
      | state     | VIC             |
      | postcode  | 3186            |
      | agent_min_price | 400000    |
      | agent_max_price | 500000    |
      | client_min_price  | 450000  |
      | client_max_price | 600000   |
      | land_size | 500             |
      | priority  | Medium          |
      | fName     | Auto            |
      | lName     | Run             |
    And as a staff member, I confirm the appraisal status to "Prospective"
    And as a staff member, I can "confirm" the appraisal details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
    And as a staff member, I confirm the appraisal status to "Prospective"
    And as a staff member, I confirm my appraisal is "Active"
    And as a staff member, I change the appraisal status to "Completed"
    And as a staff member, I apply business rules to the appraisal
    And as a staff member, I confirm the appraisal status to "Completed"
    And as a staff member, I set the appraisal display to "Inactive"
    And as a staff member, I confirm my appraisal is "Inactive"
  Examples:
  | Property Type | Property Action |
  | Commercial    | Sale            |
  | Business      | Sale            |
  | Rural         | Sale            |

  @appraisal3 @regression
  Scenario Outline: As a Portplus user, I want to be able to create an appraisal for rental
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I am able to create an appraisal for "<Property Type>" rental property for "<Property Action>" with the following:
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
      | priority  | Medium          |
    And as a staff member, I confirm the appraisal status to "Prospective"
    And as a staff member, I can "confirm" the appraisal details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
  Examples:
    | Property Type | Property Action |
    | Residential   | For Rent        |
    | Rural         | For Rent        |

  @auction @appraisal4 @regression
  Scenario Outline: As a Portplus user, I want to be able to create for auction properties
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I am able to create an appraisal for "<Property Type>" auction property for "<Property Action>" with the following:
      | agent     | Tony Horn       |
      | street    | testing street  |
      | suburb    | Brighton        |
      | state     | VIC             |
      | postcode  | 3186            |
      | priority  | Medium          |
      | agent_min_price | 400000    |
      | agent_max_price | 500000    |
      | client_min_price  | 450000  |
      | client_max_price | 600000   |
    And as a staff member, I confirm the appraisal status to "Prospective"
    And as a staff member, I can "confirm" the appraisal details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
  Examples:
    | Property Type | Property Action |
    | Residential   | Auction         |
    | Commercial    | Auction         |
    | Business      | Auction         |
    | Rural         | Auction         |

  @appraisal5 @regression
  Scenario: As a Portplus user, I want to be able to create appraisal for commercial for lease property
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I am able to create an appraisal for "Commercial" lease "For Lease" with the following:
      | agent     | Tony Horn       |
      | street    | testing street  |
      | suburb    | Brighton        |
      | state     | VIC             |
      | postcode  | 3186            |
      | lease     | 600             |
      | term      | 30              |
      | priority  | Medium          |
    And as a staff member, I can "confirm" the appraisal details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
