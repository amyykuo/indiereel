Feature: Sign out
  
  So I can protect my account from unauthorized access
  As a signed in user
  I should be able to sign out

Background:

  Scenario: User signs out
    Given I am logged in
    When  I sign out
    Then  I should be on the welcome page
    When  I return to the site
    Then  I should be signed out
    And   I should be on the welcome page
