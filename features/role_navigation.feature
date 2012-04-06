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
#  follow link to role's portfolio page thru portfolio section
  Then I should be on the "tester" "portfolio" page for the "talent" role

Scenario: Go to Role's Projects Page
#  follow link to role's projects page thru projects section
  Then I should be on the "tester" "projects" page for the "talent" role

