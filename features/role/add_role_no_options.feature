Feature: add a role without any options

  As a multi-talented individual
  I want to be able to have multiple role profiles
  So that I represent each of my talents explicitly

Background:
  Given I am signed in with provider "facebook"
  And I have the following roles:
    | role_type  | user_id | role_name | email         | role_type_description | role_experience | role_skills |
    |  director  |  1      |  John     | test@xxxx.com | I am awesome!         | everything      | none        |
    |   talent   |  1      |  Nguyen   | best@xxxx.com | I not awesome         | nothing         | some        |
    |    crew    |  1      |  Apples   | best@xxxx.com | I not awesome         | nothing         | some        |
    |  producer  |  1      |  Banana   | best@xxxx.com | I not awesome         | nothing         | some        |
  

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
  And the "Choose a Role Type" dropdown should contain: Director
  And the "Choose a Role Type" dropdown should not contain: Talent, Producer, Crew
  
