

Feature: As a user I want to be able to create and delete my enquiries

  @newsletter @smoke @regression
  Scenario: As a Portplus user, I want to be able to create and send newsletter
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I am able to create a newsletter
    And I am able to select "Template One" template
    And I fill in "Template One" template with the following:
      | emailSubject     | Unique Newsletter     |
      | headline         | Newsletter Headline   |
      | greetings        | Newsletter Greetings  |
    And I "email" the newsletter
    And I am able to confirm that the "Unique Newsletter" is being sent
    And I am able to view the newsletter
    And I confirm the newsletter "Template One" has the following:
      | headline         | Newsletter Headline   |
      | greetings        | Newsletter Greetings  |

