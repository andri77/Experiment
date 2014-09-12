@client @regression
Feature: As a user I want to be able to create and edit client

  Background:
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    Then I should be directed to client manager page
    When I login as a staff member

  @create-vendor @smoke @client
  Scenario: As a Portplus user, I want to be able to create a new vendor
    And as a staff member, I select to add a client
    And as a staff member, I am able to select my options for the new vendor
    And as a staff member, I am able to fill in the form with the following:
      | fName     | Auto            |
      | lName     | Run           |
      | mobile    | 0421211111      |
      | street    | testing street  |
      | suburb    | Melbourne       |
      | state     | VIC             |
      | postcode  | 3000            |
      | country   | Australia       |
      | email     | autotest@autotest.com   |
    And I will be directed to Calendar Page

  @edit-vendor @client
  Scenario: As a Portplus user, I want to be able to edit the vendor
    And as a staff member, I can search for a client "Auto Run"
    And as a staff member, I can select the client
    And as a staff member, I can "edit" the client details with the following:
      | street         | suburb   | state | postcode  |
      | 2 test street  | Sydney   | NSW   | 2000      |
    And I should wait for "3" seconds
    And as a staff member, I can select the client's physical address
    And as a staff member, I can "confirm" the client details with the following:
      | street         | suburb   | state | postcode  |
      | 2 test street  | Sydney   | NSW   | 2000      |

  @create-buyer @smoke @client
  Scenario: As a Portplus user, I want to be able to create a new buyer
    And as a staff member, I select to add a client
    And as a staff member, I am able to select my options for the new buyer
    And as a staff member, I am able to fill in the client form with the following:
      | fName     | Star            |
      | lName     | Lord            |
      | mobile    | 0421211111      |
      | street    | testing street  |
      | suburb    | Melbourne       |
      | state     | VIC             |
      | postcode  | 3000            |
      | country   | Australia       |
      | email     | autobuy@autotest.com   |
      | min_price   | 0             |
      | max_price   | 1000000       |
    And I will be directed to Calendar Page

  @edit-buyer @client
  Scenario: As a Portplus user, I want to be able to edit the buyer
    And as a staff member, I can search for a client "Star Lord"
    And as a staff member, I can select the client
    And as a staff member, I can "edit" the client details with the following:
      | street         | suburb   | state | postcode  |
      | 2 test street  | Sydney   | NSW   | 2000      |
    And I should wait for "3" seconds
    And as a staff member, I can select the client's physical address
    And as a staff member, I can "confirm" the client details with the following:
      | street         | suburb   | state | postcode  |
      | 2 test street  | Sydney   | NSW   | 2000      |

  @create-tenant @client
  Scenario: As a Portplus user, I want to be able to create a new tenant
    And as a staff member, I select to add a client
    And as a staff member, I am able to select my options for the new tenant
    And as a staff member, I am able to fill in the client form with the following:
      | fName     | Star            |
      | lName     | Tenant          |
      | mobile    | 0421212023      |
      | street    | testing street  |
      | suburb    | Melbourne       |
      | state     | VIC             |
      | postcode  | 3000            |
      | country   | Australia       |
      | email     | test@test.com   |
      |min_price  | 100             |
      |max_price  | 1000            |
    And I will be directed to Calendar Page

  @edit-tenant  @client
  Scenario: As a Portplus user, I want to be able to edit the tenant
    And as a staff member, I can search for a client "Star Tenant"
    And as a staff member, I can select the client
    And as a staff member, I can "edit" the client details with the following:
      | street         | suburb   | state | postcode  |
      | 2 test street  | Sydney   | NSW   | 2000      |
    And I should wait for "3" seconds
    And as a staff member, I can select the client's physical address
    And as a staff member, I can "confirm" the client details with the following:
      | street         | suburb   | state | postcode  |
      | 2 test street  | Sydney   | NSW   | 2000      |


  @create-landlord @client
  Scenario: As a Portplus user, I want to be able to create a new landlord
    And as a staff member, I select to add a client
    And as a staff member, I am able to select my options for the new landlord
    And as a staff member, I am able to fill in the form with the following:
      | fName     | Johnny          |
      | lName     | Utah            |
      | mobile    | 0421212023      |
      | street    | testing street  |
      | suburb    | Melbourne       |
      | state     | VIC             |
      | postcode  | 3000            |
      | country   | Australia       |
      | email     | test@test.com   |
    And I will be directed to Calendar Page

 

  @create-general @client
  Scenario: As a Portplus user, I want to be able to create a new general
    And as a staff member, I select to add a client
    And as a staff member, I am able to select my options for the new general
    And as a staff member, I am able to fill in the form with the following:
      | fName     | General         |
      | lName     | Sherman         |
      | mobile    | 0421212023      |
      | street    | testing street  |
      | suburb    | Melbourne       |
      | state     | VIC             |
      | postcode  | 3000            |
      | country   | Australia       |
      | email     | test@test.com   |
    And I will be directed to Calendar Page

