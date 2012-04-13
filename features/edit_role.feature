Feature: Edit Role Profile page

  As a User
  I want to be able to edit my role profile
  So that I can keep my information up to date

Background:

  Given I am signed in with provider "facebook"
  And I have the following roles:
  | role_type  | user_id | role_name |     email     | phone_number | role_type_description | role_experience | age_range | role_skills | physique |
  |  director  |    1    |   John    | test@xxxx.com |  1234567890  |     I am awesome!     |    everything   |     0     |     none    |  pretty  |
  |   talent   |    1    |  Nguyen   | best@xxxx.com |  1234567890  |     I not awesome     |      nothing    |     1     |     same    |   ugly   |
  
  And I am on my "tester talent" Edit Page
  And I should see "Stage Name:"

Scenario: Editing basic information successfully - change name
  When I fill in "role_role_name" with "My name is now pie"
  And I press "Update Role"
  Then I should be on my "tester talent" profile page
  And I should see "My name is now pie"
  And I should see "I not awesome"
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

# didn't test anything new  
#Scenario: make changes, don't click update, instead follow to home page thru navbar, no changes should've been made
#  When I fill in "role_role_name" with "My name is now pie"
#  And I follow "IndieReel"
#  Then I should be on my "tester" home page
#  And I should see "Nguyen"
#  But I should not see "My name is now pie"
