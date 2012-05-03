Feature: home page role modifying links
  
  As a user
  I want to be able to have full access all my roles
  So I can see them
  
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
  
  
Scenario: Go to Add a Role
  When I follow "add_role"
  Then I should be on the Create Role Page

Scenario: Delete all Roles one by one
  When I press "Delete" within the "Director" section
  Then I should be on my "tester" home page
  And I should not see "Director"
  But I should see "Talent"
  When I press "Delete" within the "Talent" section
  Then I should be on my "tester" home page
  And I should see "CREATE ONE"

Scenario: Go to Role's Edit Page
  When I follow "Edit Profile" within the "Talent" section
  Then I should be on my "tester talent" Edit Page

Scenario: Go to Role's Profile Page
  When I follow "View All Profile Fields" within the "Talent" section
  Then I should be on my "tester talent" profile page

Scenario: Go to Role's Portfolio Page
  When I follow "Portfolio" within the "Director" section
  Then I should be on the "tester" Portfolio page for the "director" role
  And I should see "Portfolio"

Scenario: Go to Role's Projects Page
  When I follow "Projects" within the "Talent" section
  Then I should be on the "tester" Projects page for the "talent" role
  And I should see "projects"
