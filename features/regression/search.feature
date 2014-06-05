Feature: A simple magenta search

  @search
  Scenario: As a tester, I want to use Selenium Webdriver method
  Given I use selenium webdriver method
  #Given I am on magenta homepage
  And I search for item
  And I add item to cart
  When I'm at checkout page
  And I update my quantity
  Then I checkout as guest