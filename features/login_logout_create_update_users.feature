# MAY NOT NEED THIS. NEEDS TO BE TESTED WITH RSPEC T-T

Feature: Log in/out and Creating/Updating Users

  As a customer
  I want to use IndieReel with a third party service
  So that I can get myself out there (someone please make this SMART, refer to chapter 4.2 in book)

  Scenario: A new user logins and needs an account
    Given I am on the welcome page
    And   I am not a registered user
    And   my facebook first_name is "Amy"
    When  I click on "Log In"
    And   I log in through facebook
    Then  I should be on the home page
    And   I should see "Welcome Amy"
    But   I should not see any profiles

  Scenario: A registered user logins and needs an info update
    Given I am on the welcome page
    And   I am a registed user
    And   my indiereel first_name is "Amy"
    And   my facebook first_name is "Status"
    When  I click on "Log In"
    And   I log in through facebook
    Then  I should be on the home page
    And   I should see "Welcome Status"
    And   I should see my talent profile # there's a profile, its theirs, you get the idea
    But   I should not see "Welcome Amy"
