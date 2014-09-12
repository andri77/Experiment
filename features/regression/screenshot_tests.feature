@screenshots
Feature: As a user I want to be able to create and modify my property

  @login
  Scenario: As a Portplus user, I want to be able to login
    Given I am on Portplus homepage
    And as a user, I fill in my user name as "dcropper"
    And as a user, I fill in my password as "Pa$$w0rd"
    When I click login button
    Then I should be directed to the login page

  @diff
  Scenario: As a tester, I want to do screenshot comparison
    Given I am on Portplus homepage
    And I take a screenshot off the "home" page and save it at "./features/screenshots/"
    Then I compare the screenshots for "home" page

  @diff2
  Scenario Outline: As a Portplus user, I want to be able to create a new client
    Given I am at login page
    Given I am on Portplus homepage
    And I take a screenshot off the "login" page and save it at "./features/screenshots/"
    Then I compare the screenshots for "login" page
    And I search for "3406"
    And I take a screenshot off the "search" page and save it at "./features/screenshots/"
    Then I compare the screenshots for "search" page
    And I click on the first agent
    When I login as a staff member
    And I take a screenshot off the "control-panel" page and save it at "./features/screenshots/"
    Then I compare the screenshots for "control-panel" page
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
    And I take a screenshot off the "<Property Type><Property Action>" page and save it at "./features/screenshots/"
    Then I compare the screenshots for "<Property Type><Property Action>" page
  Examples:
    | Property Type | Property Action |
    | Residential   | Sale            |
    | Commercial    | Sale            |
    | Business      | Sale            |
    | Rural         | Sale            |
    | Residential   | Auction         |
    | Commercial    | Auction         |
    | Business      | Auction         |
    | Rural         | Auction         |

  @setup-baseline
  Scenario Outline: As a Portplus user, I want to be able to create a new client
    Given I am at login page
    Given I am on Portplus homepage
    And I take a screenshot off the "login" page and save it at "./features/baseline_screenshots/"
    And I search for "3406"
    And I take a screenshot off the "search" page and save it at "./features/baseline_screenshots/"
    And I click on the first agent
    When I login as a staff member
    And I take a screenshot off the "control-panel" page and save it at "./features/baseline_screenshots/"
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
    And I take a screenshot off the "<Property Type><Property Action>" page and save it at "./features/baseline_screenshots/"
  Examples:
    | Property Type | Property Action |
    | Residential   | Sale            |
    | Commercial    | Sale            |
    | Business      | Sale            |
    | Rural         | Sale            |
    | Residential   | Auction         |
    | Commercial    | Auction         |
    | Business      | Auction         |
    | Rural         | Auction         |
