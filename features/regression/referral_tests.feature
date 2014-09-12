

Feature: As a user I want to be able to send referral

  @referral @wip
  Scenario: As a Portplus user, I want to be able to send a referral
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I am able to send a referral
    And I fill in referral form with the following:
      | number    | 199 |
      | street    | High Street   |
      | suburb    | PRESTON       |
      | state     | VIC             |
      | postcode  | 3072            |
      | country   | Australia       |
      | fName     | Test            |
      | lName     | Again           |
      | mobile    | 0421212023      |
      | email     | autotest@autotest.com    |
#    And I "email" the newsletter
#    And I am able to confirm that the "Unique Newsletter" is being sent
#    And I am able to view the newsletter
#    And I confirm the newsletter "Template One" has the following:
#      | headline         | Newsletter Headline   |
#      | greetings        | Newsletter Greetings  |

