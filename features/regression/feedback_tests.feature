@feedback
Feature: As a user I want to be able to create and delete my enquiries

  @inspection-feedback @wip
  Scenario: As a Portplus user, I want to be able to create and delete OFI
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    When I login as a staff member
    And as a staff member, I select to add an inspections feedback
    And as a staff memeber, I add a new private inspection
    And I select agent "Auto Run" in the inspection form

#    And as a staff member, I am able to fill in the enquiry form with the following:
#      | fName     | Test            |
#      | lName     | Again           |
#      | mobile    | 0421212023      |
#      | email     | test@test.com   |
#    And as a staff member, I am able to fill in the extended enquiry form with the following:
#      | street    | testing street  |
#      | suburb    | Melbourne       |
#      | state     | VIC             |
#      | postcode  | 3000            |
#      | country   | Australia       |

