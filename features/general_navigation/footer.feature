Feature: Footer

  As a newcomer
  I want to be able check out the links in the footerto use the navigation bar
  So that I can see how awesome IndieReel is!

Background:

  #Given I am on the welcome page
  #And I am not signed in with provider "facebook"
  
Scenario: Check About IndieReel when not signed in
  Given I am on the welcome page
  And I am not signed in with provider "facebook"
  When I follow "About IndieReel"
  Then I should be on the About page
  And I should see "how we do it"

Scenario: Check About IndieReel when signed in
  Given I am signed in with provider "facebook"
  When I follow "About IndieReel"
  Then I should be on the About page
  And I should see "how we do it" 

Scenario: Check Contact Us when not signed in
  Given I am on the welcome page
  And I am not signed in with provider "facebook"
  When I follow "Contact Us"
  Then I should be on the Contact page
  And I should see "contact us at bloop"

Scenario: Check Meet the Team when not signed in
  Given I am on the welcome page
  And I am not signed in with provider "facebook"
  When I follow "Meet the Team"
  Then I should be on the Meet page
  And I should see "who we are"

Scenario: Check Help when not signed in
  Given I am on the welcome page
  And I am not signed in with provider "facebook"
  When I follow "Help"
  Then I should be on the FAQ page
  And I should see "FAQ"
  
