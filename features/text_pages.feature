Feature: Text Pages

  Scenario: show list of pages in footer
    Given a text page with name: "first"
      And a text page with name: "second"
    When I go to "/"
    Then I should see footer
     And I should see link "first" with href: "pages/first"
     And I should see link "first" with href: "pages/second"

  Scenario: go to specific page
    Given a text page with name: "first", body: "<p>PPP<\p>"
      And I am on '/'
    When I click to page "first"
    Then I should see h1 "first"
     And I should see page body "PPP"