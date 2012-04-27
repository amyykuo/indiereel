Feature: footer link navigation
  
  As a newcomer
  I want to be able check out the links in the footer
  So that I can see how awesome IndieReel is!

Background:
  Given I am on the welcome page
  
Scenario: Check About IndieReel when not signed in
  When I follow "About IndieReel"
  Then I should be on the About page
  
Scenario: Check About IndieReel when signed in
  When I follow "About IndieReel"
  Then I should be on the About page
  
Scenario: Check Contact Us when not signed in
  When I follow "Contact Us"
  Then I should be on the Contact page

Scenario: Check Meet the Team
  When I follow "Meet the Team"
  Then I should be on the Meet page
  
Scenario: Check Help when not signed in
  When I follow "FAQ"
  Then I should be on the FAQ page  
