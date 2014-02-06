Feature: Sales

  Scenario: Send emails to customer with subscription
    Given I sign in as admin
      And a customer with email: "first@example.com", subscription: "true"
      And a customer with email: "second@example.com", subscription: "false"
    When I go to "/admin/sales/new"
     And I fill up input for name as "1"
     And I click to "submit"
    Then email:  "first@example.com" should received new email
     But email:  "first@example.com" shouldn't received new email