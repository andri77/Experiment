@client @regression
Feature: As a user I want to be able to create and edit client

  Background:
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    Then I should be directed to client manager page
    When I login as a staff member

  @create-client
  Scenario: As a Portplus user, I want to be able to create a new client
    And as a staff member, I select to add a client
    And as a staff member, I am able to select my options for the new client
    And as a staff member, I am able to fill in the form with the following:
      | fName     | Test            |
      | lName     | Again           |
      | mobile    | 0421212023      |
      | street    | testing street  |
      | suburb    | Melbourne       |
      | state     | VIC             |
      | postcode  | 3000            |
      | country   | Australia       |

  @edit-client
  Scenario: As a Portplus user, I want to be able to edit the client
    And as a staff member, I can search for a client "Test Again"
    And as a staff member, I can select the agent
    And as a staff member, I can "edit" the client details with the following:
      | street         | suburb   | state | postcode  |
      | 2 test street  | Sydney   | NSW   | 2000      |
    And I should wait for "3" seconds
    And as a staff member, I can select the agent's pyhsical address
    And as a staff member, I can "confirm" the client details with the following:
      | street         | suburb   | state | postcode  |
      | 2 test street  | Sydney   | NSW   | 2000      |

    #  @login
#  Scenario: As a Portplus user, I want to be able to login
#    Given I am on Portplus homepage
#    And as a user, I fill in my user name as "dcropper"
#    And as a user, I fill in my password as "Pa$$w0rd"
#    When I click login button
#    Then I should be directed to the login page