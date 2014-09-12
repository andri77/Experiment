@property @regression
Feature: As a user I want to be able to create and modify my property

  @create-withdraw-property @smoke
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
      | headline  | This is my Headline |
      | description | This is my Description |
      | bedrooms  | 3               |
      | bathrooms | 2               |
      | garages   | 2               |
      | carports  | 1               |
      | toilets   | 2               |
#    And I attach my property image
    And as a staff member, I apply business rules to the property
    And as a staff member, I can "confirm" the property details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
    And as a staff member, I confirm my property is "active"
    And as a staff member, I am able to withdraw my property
    And as a staff member, I confirm my property is "withdrawn"

  @edit-property @smoke
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
      | headline  | This is my Headline |
      | description | This is my Description |
      | bedrooms  | 3               |
      | bathrooms | 2               |
      | garages   | 2               |
      | carports  | 1               |
      | toilets   | 2               |
    And as a staff member, I apply business rules to the property
    And as a staff member, I can "confirm" the property details with the following:
      | street          | suburb     | state | postcode  | bedrooms | bathrooms |
      | testing street  | Brighton   | VIC   | 3186      | 3        | 2         |
#    And I select the first property on white board
    And as a staff member, I can "edit" the property details with the following:
      | street     | suburb   | state | postcode  | bedrooms | bathrooms |
      | qa street  | Sydney   | NSW   | 2000      | 2        | 5         |
    And as a staff member, I can "confirm" the property details with the following:
      | street     | suburb   | state | postcode  | bedrooms | bathrooms |
      | qa street  | Sydney   | NSW   | 2000      | 2        | 5         |

  @sell-property
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
      | bedrooms  | 3               |
      | bathrooms | 2               |
      | garages   | 2               |
      | carports  | 1               |
      | toilets   | 2               |
      | headline  | This is my Headline |
      | description | This is my Description |
#    And I attach my property image
    And as a staff member, I apply business rules to the property
    And as a staff member, I can "confirm" the property details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
#    And I select the first property on white board
    And as a staff member, I can sell the property for $"500000"
    And as a staff member, I confirm my property is "sold"

  @sell-property2 @smoke
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
      | bedrooms  | 3               |
      | bathrooms | 2               |
      | garages   | 2               |
      | carports  | 1               |
      | toilets   | 2               |
      | headline  | This is my Headline |
      | description | This is my Description |
    And as a staff member, I apply business rules to the property
    And as a staff member, I can "confirm" the property details with the following:
      | street             | suburb    |
      | testing street     | BRIGHTON  |
    And as a staff member, I can add vendor to property
    And as a staff member, I can sell the property for $"500000" with vendor
    And as a staff member, I apply business rules to the property
    And as a staff member, I confirm my property is "sold"

  @web-choice @regression @fragile
  Scenario: As a web-choice agent, I want to be able to upload, confirm and delete image
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a web-choice agent
    And I select property in "qa" in web-choice
    And I upload an image via web-choice
    Then I confirm and delete the image in web-choice
    #Upload image test is not working with FF