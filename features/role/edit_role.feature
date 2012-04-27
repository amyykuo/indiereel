Feature: Edit Role Profile page

  As a User
  I want to be able to edit my role profile
  So that I can keep my information up to date

Background:
  Given I am signed in with provider "facebook"
  
  And I have the following roles:
    | role_type  | user_id | role_name | email         | role_type_description | role_experience | role_skills |
    |  director  |  1      |  John     | test@xxxx.com | I am awesome!         | everything      | none        |
    |   talent   |  1      |  Nguyen   | best@xxxx.com | I not awesome         | nothing         | some        |
  And I am on my "tester talent" Edit Page
  And I should see "Stage Name:"

Scenario: editing basic information successfully - change name
  When I fill in "role_role_name" with "My name is now pie"
  And I press "Update Profile"
  Then I should be on my "tester talent" profile page
  And I should see "My name is now pie"
  And I should see "I not awesome"
  And I should see "Talent was successfully updated."
  But I should not see "John"

Scenario: cancel editing
  When I follow "Cancel"
  Then I should be on my "tester talent" profile page
  And I should see "I not awesome"

Scenario: write a description and cancel editing
  When I fill in "role_role_type_description" with "I am apple pie"
  And I follow "Cancel"
  Then I should be on my "tester talent" profile page
  And I should see "I not awesome"
  But I should not see "I am apple pie"

Scenario: On the Edit Role Page, do  not input stage name, submit, should get an error
  When I fill in "role_role_name" with ""
  And I press "Update Profile"
  Then I should be on my "tester talent" Edit Page
  And I should see "There were some errors in updating your role."

