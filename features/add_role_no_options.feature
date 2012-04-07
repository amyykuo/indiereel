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
  |    crew    |  1      |  Apples   | http://pi.com/user.png | best@xxxx.com | I not awesome         | nothing         | some        |
  |  producer  |  1      |  Banana   | http://pi.com/user.png | best@xxxx.com | I not awesome         | nothing         | some        |
  

Scenario: There should not be an Add_a_Role option on the home page
  When I am on my "tester" home page
  Then I should see "Talent"
  And I should see "Producer"
  And I should see "Director"
  And I should see "Crew"
  But I should not see "Add a role"

Scenario: Check that roles in dropdown do not include already existing roles
  When I am on my "tester" home page
  Then I should see "Talent"
  And I should see "Producer"
  And I should see "Director"
  And I should see "Crew"
  But I should not see "Add a role"
  When I press "Delete" within the "Director" section
  Then I should be on my "tester" home page
  And I should see "Producer"
  And I should see "Crew"
  And I should see "Talent"
  But I should not see "Director"
  When I follow "Add a role"
  Then I should be on the Create Role Page
  And the "Choose a Role Type" dropdown should contain: director
  And the "Choose a Role Type" dropdown should not contain: talent, producer, crew
  
# not necessary
#Scenario: On the Create Role Page, do not select a role, don't input data, and cancel
#  When I click on the New Profile button
#  Then I should be on the Create Role Page
#  And I click on "cancel"
#  Then I should be on my "amyykuo" home page
#  And I should see my current roles

