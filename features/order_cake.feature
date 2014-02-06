Feature: Order cake
  I want to customer can order my cake

  Background:
    Given I am on '/'

  Scenario: show order form
    When I order "Cake House" cake
    Then I should see form for order
     And I should see input for "name"
     And I should see input for "email"
     And I should see input for "phone"
     And I should see check box for "subscription"

  Scenario fill form
    When I order "Home" cake
     And I fill up input "name" as "cakes lover"
     And I fill up input "email" as "cakes@example.com"
     And I fill up input "phone" as "78901231234"
     And I click to "submit"
    Then I should see success
     And Admin received new email

  Scenario Outline:
    When I order "Home" cake
     And I fill up input "email" as "<bad_email>"
     And I click to "submit"
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