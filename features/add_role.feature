Feature: Add a role profile

  As a multi-talented individual
  I want to be able to have multiple role profiles
  So that I represent each of my talents explicitly

Background:

  Given I am signed in with provider "facebook"
  And I have the following roles:
  | role_type  | user_id | role_name | profile_pic            | email         | role_type_description | role_experience | role_skills |
  |  director  |  1      |  John     | http://hi.com/user.png | test@xxxx.com | I am awesome!         | everything      | none        |
  |   talent   |  1      |  Nguyen   | http://pi.com/user.png | best@xxxx.com | I not awesome         | nothing         | some        |
    
  And I am on my "tester" home page

Scenario: Adding a Producer role successfully
  When I follow "Add a role"
  Then I should be on the Create Role Page
  And the "Choose a Role Type" dropdown should contain: producer, crew
  And the "Choose a Role Type" dropdown should not contain: talent, director
  When I select "producer" from "Choose a Role Type"
  When I press "Create role."
  Then I should be on my "tester producer" profile page

Scenario: On the Create Role Page, select a role but don't input data, and cancel
  When I follow "Add a role"
  Then I should be on the Create Role Page
  And the "Choose a Role Type" dropdown should contain: producer, crew
  And the "Choose a Role Type" dropdown should not contain: talent, director
  When I select "producer" from "Choose a Role Type"
  And I follow "Cancel"
  Then I should be on my "tester" home page
  And I should see "Talent"
  And I should see "Director"
  But I should not see "Producer"
  And I should not see "Crew"
  
Scenario: Check if Add a Role options updates, delete Crew on homepage, then check create role page
  When I 

# not necessary
#Scenario: On the Create Role Page, input data, and cancel
#  When I click on the New Profile button
#  Then I should be on the Create Role Page
# When I select a role
# And I input data
#  And I click on "cancel"
#  Then I should be on my "amyykuo" home page
#  And I should not see "whatever role I selected"
 
