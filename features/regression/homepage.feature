
Feature: Magenta functions

Background:
  Given I am on magenta homepage

  @categories
Scenario Outline: Navigating through categories
  When I click "<category>"
#  And I go into debug mode
  Then I will arrive in category "<page>"

    Examples:
    | category       | page                  |
    | Akoya          | Akoya - Wallpapers    |
    | Madison        | Madison - Wallpapers  |
    | Leather        | Leather - Wallpapers  |


@result
Scenario: Searching for products
  When I search for "Prosper"
  And I will get "Prosper" in search result page
