Feature: Home page

As a User
I want to be able to access my Role's profile sections
So I can see how they look

Background:

  Given I am signed in with provider "facebook"
  
  And I have the following roles:
  | role_type  | user_id | role_name | profile_pic            | email         | role_type_description | role_experience | role_skills |
  |  director  |  1      |  John     | http://hi.com/user.png | test@xxxx.com | I am awesome!         | everything      | none        |
  |   talent   |  1      |  Nguyen   | http://pi.com/user.png | best@xxxx.com | I not awesome         | nothing         | some        |
    
  And I am on my "tester talent" profile page
  
Scenario: Go to Role's Portfolio Page
  When I follow "View full portfolio" within the "Portfolio" section
  Then I should be on the "tester" Portfolio page for the "talent" role
  # need to test this more thoroughly

Scenario: Go to Role's Projects Page
  When I follow "View all projects" within the "Projects" section  
  Then I should be on the "tester" Projects page for the "talent" role
  # need to test this more thoroughly

Scenario: Go to Role's Edit this role Page
  When I follow "Edit this role"
  Then I should be on my "tester talent" Edit Page
  And I should see "Stage Name:"
  
Scenario: Delete this Role
  When I press "Delete this Role"
  Then I should be on my "tester" home page
  And I should not see "Talent"
