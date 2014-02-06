Feature: Order sales
  I want to customer can order my sales

  Background:
    Given I am on '/'

  Scenario: Show form
    When I order sales
    Then I should see form for order
     And I should see input for "name"
     And I should see input for "email"
     And I should see input for "phone"
     And I should see check box for "subscription"

  Scenario fill form
    When I order sales
     And I fill up input "name" as "cakes lover"
     And I fill up input "email" as "cakes@example.com"
     And I fill up input "phone" as "78901231234"
     And I click to "submit"
    Then I should see success
     And Admin received new email