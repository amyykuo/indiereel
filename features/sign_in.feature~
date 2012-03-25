Feature: Sign in

  In order to get access to protected sections of the site
  A user
  Should be able to sign in
  
  Scenario: User is not signed up
    Given I do not exist as a user
    And   I am on the welcome page
    When  I sign in through Facebook #how do you test this?
#    And   I return to the site
    Then  I should be on the home page
    And   I should be signed in # check the website example
    And   I should see "Welcome whatever-your-facebook-name-is"

  Scenario: Registered User signs in successfully
    Given I exist as a user
    And   I am not logged in
    When  I sign in through Facebook
    And   I return to the site
    Then  I should be on the home page
    And   I should be signed in
    And   I should see "all my stuff there"
