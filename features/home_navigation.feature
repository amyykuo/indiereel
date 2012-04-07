Feature: Home page

As a User
I want to be able to have full access all my roles
So I can see them

Background:
  Given I am signed in with provider "facebook"
  
  And I have the following roles:
  | role_type  | user_id | role_name | profile_pic            | email         | role_type_description | role_experience | role_skills |
  |  director  |  1      |  John     | http://hi.com/user.png | test@xxxx.com | I am awesome!         | everything      | none        |
  |   talent   |  1      |  Nguyen   | http://pi.com/user.png | best@xxxx.com | I not awesome         | nothing         | some        |
    
  And I am on my "tester" home page
  

Scenario: Go to Add a Role
  When I follow "Add a role"
  Then I should be on the Create Role Page

Scenario: Delete all Roles one by one
  When I press "Delete" within the "Director" section
  Then I should be on my "tester" home page
  And I should not see "Director"
  But I should see "Talent"
  When I press "Delete" within the "Talent" section
  Then I should be on my "tester" home page
  And I should see "Create one?"

Scenario: Go to Role's Edit Page
  When I follow "Edit this Role" within the "Talent" section
  Then I should be on the "tester" "edit" page for the "talent" role

Scenario: Go to Role's Profile Page
  follow talent view link
  When I follow "View this Role" within the "Talent" section
  Then I should be on my "tester talent" profile page

Scenario: Go to Role's Portfolio Page
  When I follow "Portfolio" within the "Director" section
  Then I should be on the "tester" "portfolio" page for the "director" role
  And I should see "Portfolio"

Scenario: Go to Role's Projects Page
  When I follow "Projects" within the "Talent" section
  Then I should be on the "tester" "projects" page for the "talent" role
  And I should see "Projects"

