
Feature: As a user I want to log in

  @login
  Scenario: As a Portplus tester, I want to be able to login
    Given I am on Portplus homepage
    And I fill in my user name as "dcropper"
    And I fill in my password as "Pa$$w0rd"
    When I click login button
    Then I should be directed to the login page

  @create-client
  Scenario: As a Portplus tester, I want to be able to create a new client
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    Then I should be directed to client manager page
    And as a staff member, I select to add a client
    And as a staff member, I am able to select my options for the new client
    And as a staff member, I am able to fill in the form with the following:
      | fName     | Test            |
      | lName     | Again           |
      | email     | test@again.com  |
      | Street    | testing street  |
      | Suburb    | Melbourne       |
      | State     | VIC             |
      | Postcode  | 3000            |
      | Country   | Australia       |
