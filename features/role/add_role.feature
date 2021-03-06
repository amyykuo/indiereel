Feature: add a role

  As a multi-talented individual
  I want to be able to have multiple role profiles
  So that I represent each of my talents explicitly

Background:
  Given I am signed in with provider "facebook"
  And I have the following roles:
    | role_type  | user_id | role_name | email         | role_type_description | role_experience | role_skills |
    |  director  |  1      |  John     | test@xxxx.com | I am awesome!         | everything      | none        |
    |   talent   |  1      |  Nguyen   | best@xxxx.com | I not awesome         | nothing         | some        |
  And I am on my "tester" home page
  

Scenario: Adding a Producer role successfully
  When I follow "add_role"
  Then I should be on the Create Role Page
  And the "Choose a Role Type" dropdown should contain: Producer, Crew
  And the "Choose a Role Type" dropdown should not contain: Talent, Director
  When I select "Producer" from "Choose a Role Type"
  And I fill in "role_role_name" with "Apples"
  And I press "Create Role"
  Then I should be on my "tester producer" profile page
  And I should see "Apples"
  And I should see "Role created successfully."

Scenario: On the Create Role Page, select a role but don't input data, and cancel
  When I follow "add_role"
  Then I should be on the Create Role Page
  And the "Choose a Role Type" dropdown should contain: Producer, Crew
  And the "Choose a Role Type" dropdown should not contain: Talent, Director
  When I select "Producer" from "Choose a Role Type"
  And I follow "Cancel"
  Then I should be on my "tester" home page
  And I should see "Talent"
  And I should see "Director"
  But I should not see "Producer"
  And I should not see "Crew"
  
Scenario: choose a role options should be correctly updating
  When I follow "add_role"
  Then I should be on the Create Role Page
  And the "Choose a Role Type" dropdown should contain: Producer, Crew
  And the "Choose a Role Type" dropdown should not contain: Talent, Director
  And I follow "Cancel"
  Then I should be on my "tester" home page
  When I press "Delete" within the "Director" section
  Then I should be on my "tester" home page
  And I should see "Talent"
  But I should not see "Director"
  And I should not see "Crew"
  And I should not see "Producer"
  When I follow "add_role"
  Then I should be on the Create Role Page
  And the "Choose a Role Type" dropdown should contain: Director, Producer, Crew
  And the "Choose a Role Type" dropdown should not contain: Talent

Scenario: On the Create Role Page, do not input stage name, submit, should get an error
  When I follow "add_role"
  Then I should be on the Create Role Page
  When I select "Producer" from "Choose a Role Type"
  And I fill in "role_role_name" with ""
  And I press "Create Role"
  Then I should be on the Create Role Page
  And I should see "The role was invalid. Please try again."
 
