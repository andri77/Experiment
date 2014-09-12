Feature: As a user I want to be able to manage staffs

  @staff @wip
  Scenario: As a Portplus user, I want to be able to create a new vendor
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I should be directed to client manager page
    And I obtain master password
    When I login as a staff member
    And as a staff member, I select to add a staff
    And as a staff member, I am able to fill in the staff form with the following:
      | fName     | Super            |
      | lName     | Staff           |
      | email     | staff@autotest.com   |
      | position  | Daboss                  |
      | username  | supermi                 |
    And I will be directed to Staff Management Page

