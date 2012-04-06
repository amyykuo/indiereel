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
    
#Scenario: Delete the Director Role
#  When I press "delete this role for director"
#  Then I should be on my "tester" home page
#  And I should not see "director"
#  But I should see "talent"

Scenario: Go to Talent Edit Page
#  Then I should see "Edit this Role"
#  Then I should see "Edit this Role" in the "Talent" section
  When I press "Edit this Role" within the "Talent" section
#  When I select the "Edit Role" button for the Director role
  Then I should be on the "tester" "edit" page for the "talent" role

#Scenario: Go to Role's Profile Page
#  follow talent view link
#  Then I should be on my "tester talent" profile page

#Scenario: Go to Portfolio Page
#  follow director portfolio link
#  Then I should be on the "tester" "portfolio" page for the "director" role
#  And I should see "Portfolio"

#Scenario: Go to Projects Page
#  follow talent projects link
#  Then I should be on the "tester" "projects" page for the "talent" role
#  And I should see "Projects"



