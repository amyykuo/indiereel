Feature: Portfolio Page

As a User
I want to have a portfolio page for each role
So that I can see all of my media collections

Background:
  Given I am signed in with provider "facebook"
  
  And I have the following roles:
  | role_type  | user_id | role_name | profile_pic            | email         | role_type_description | role_experience | role_skills |
  |  director  |  1      |  John     | http://hi.com/user.png | test@xxxx.com | I am awesome!         | everything      | none        |
  |   talent   |  1      |  Nguyen   | http://pi.com/user.png | best@xxxx.com | I not awesome         | nothing         | some        |
    
  And I have the following media collections:
  #have not implemented yet
  And I am on my "talent" portfolio page # not implemented yet

Scenario: Access Quickshow

Scenario: Access Quickshow edit page

Scenario: Access Quickshow media file page

Scenario: Go create a MC

Scenario: Go delete an MC

Scenario: Access an MC page

Scenario: Access an MC edit page
