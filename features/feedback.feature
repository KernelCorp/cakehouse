Feature: Feedback

  Scenario: Show feedbacks on main page
    Given a feedback from "cat lover" with text "Need cake with cat"
      And a feedback from "dog lover" with text "Need cake with dog"
      And A sale with name "sale" and description "almost free"
    When I go to "/"
    Then I should see 2 feedbacks
     And I should see feed text "Need cake with cat"
     And I should see feed text "Need cake with dog"
     And I should see name "cat lover"
     And I should see name "dog lover"