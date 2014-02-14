Feature: Order cake
  I want to customer can order my cake

  Background:
    Given A sale with name "super sale" and description "almost free"
    And I am on "/"
  @javascript
  Scenario: show order form
    When I order "Cake House" cake
    Then I should see form for order "cake"
     And I should see input for "name" in "cake" form
     And I should see input for "email" in "cake" form
     And I should see input for "phone" in "cake" form
     And I should see input for "image" in "cake" form
     And I should see check box for "subscription" in "cake" form
  @javascript
  Scenario: fill form
    When I order "Home" cake
     And I fill up input "name" as "cakes lover" in "cake" form
     And I fill up input "email" as "cakes@example.com" in "cake" form
     And I fill up input "phone" as "78901231234" in "cake" form
     And I click to "submit" in "cake" form
    Then I should see success
     And "admin@gmail.com" should receive an email
  @javascript
  Scenario Outline:
    When I order "Home" cake
     And I fill up input "email" as "<bad_email>" in "cake" form
     And I click to "submit" in "cake" form
    Then I should see that my email is bad
    Examples:
    | bad_email |
    | qqq       |
    | @qw.wq    |
    | qw@       |
    | qw.wq     |
    | qw@qw     |
    | []@.we    |
    | .ewq@w.q  |
    | qw.@qwe.q |
    | qw@dsa@.a |
    | qw-@eq.q  |