Feature: navigation bar links

  As a user
  I want to be able to use the navigation bar
  So that I can access all my roles and each one of them with a click of a button

Background:
  Given I am signed in with provider "facebook"
  
  And I have the following roles:
  | role_type  | user_id | role_name | email         | role_type_description | role_experience | role_skills |
  |  director  |  1      |  John     | test@xxxx.com | I am awesome!         | everything      | none        |
  |   talent   |  1      |  Nguyen   | best@xxxx.com | I not awesome         | nothing         | some        |
    
    And I have the following albums:
  | role_id | title       | description          | headshot |
  | 1       | quickshow   | these are mine       | false    |
  | 2       | headshots   | Where?               | true     |
  | 1       | What        | these are mine       | false    |
  | 2       | Who         | Where?               | false    |
    
  And I am on my "tester" home page
  

Scenario: Click on Talent NavBar Link
  When I follow "Talent" within the "Navigation Bar" section
  Then I should be on my "tester talent" profile page
  And I should see "Nguyen"
  
Scenario: Click on IndieReel NavBar Link
  When I follow "IndieReel" within the "Navigation Bar" section
  Then I should be on my "tester" home page
  And I should see "John"
  
Scenario: Click on Home NavBar Link
  When I follow "Home" within the "Navigation Bar" section
  Then I should be on my "tester" home page
  And I should see "John"
  
Scenario: Click on Logout Link
  When I follow "Logout" within the "Navigation Bar" section
  Then I should be on the welcome page
  And I should see "Welcome to IndieReel!"
