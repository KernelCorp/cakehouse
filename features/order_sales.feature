Feature: Order sales
  I want to customer can order my sales

  Background:
    Given A sale with name "super sale" and description "almost free"
    And I am on "/"

  Scenario: Show form
    When I order sales
    Then I should see form for order "sale"
     And I should see input for "name" in "sale" form
     And I should see input for "email" in "sale" form
     And I should see input for "phone" in "sale" form
     And I should see check box for "delivery" in "sale" form


  @javascript
  Scenario: fill form
    When I order sales
     And I fill up input "name" as "cakes lover" in "sale" form
     And I fill up input "email" as "cakes@example.com" in "sale" form
     And I fill up input "phone" as "78901231234" in "sale" form
     And I click to "submit" in "sale" form
    Then I should see success for "sale"
     And "admin@gmail.com" should receive an email