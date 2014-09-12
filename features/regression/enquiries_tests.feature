@enquiries
Feature: As a user I want to be able to create and delete my enquiries

  @smoke @regression @want-to-buy
  Scenario: As a Portplus user, I want to be able to create buying enquiries
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add a "buying" enquiry
    And as a staff member, I am able to fill in the enquiry form with the following:
      | fName     | Autobuy         |
      | lName     | Agent           |
      | mobile    | 0421211111      |
      | email     | autobuy@autotest.com |
    And as a staff member, I am able to fill in the extended enquiry form with the following:
      | street    | testing street  |
      | suburb    | Melbourne       |
      | state     | VIC             |
      | postcode  | 3000            |
      | country   | Australia       |

  @smoke @regression @want-to-sell
  Scenario: As a Portplus user, I want to be able to create selling enquiries
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add a "selling" enquiry
    And as a staff member, I am able to fill in the enquiry form with the following:
      | fName     | Auto            |
      | lName     | Run           |
      | mobile    | 0421211111      |
      | email     | autotest@autotest.com |
    And as a staff member, I am able to fill in the extended enquiry form with the following:
      | street    | testing street  |
      | suburb    | Melbourne       |
      | state     | VIC             |
      | postcode  | 3000            |
      | country   | Australia       |