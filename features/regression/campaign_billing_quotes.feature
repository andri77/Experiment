Feature: As a user I want to be able to create a Campaign Billing Quote

  Background:
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    Then I should be directed to client manager page
    When I login as a staff member



 @create-bronze-quote @wip
 Scenario: As a Portplus user, I want to be able to create a bronze quote for my property
   Given I wish to create a Campaign Billing Quote
   #When I select the property
   #Then I can select the property to have the bronze quote
    