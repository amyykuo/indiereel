Feature: Edit Role Profile page

  As a User
  I want to be able to edit my role profile
  So that I can keep my information up to date

Background:

  Given I am signed in with provider "facebook"
  And I have the following roles:
  | role_type  | user_id | role_name |      profile_pic       |     email     | phone_number | role_type_description | role_experience | age_range | role_skills | physique |
  |  director  |  12345  |  Direct   | http://hi.com/user.png | test@xxxx.com |  1234567890  |     I am awesome!     |    everything   |     0     |     none    |  pretty  |
  |   talent   |  12345  |  Talent   | http://hi.com/user.png | test@xxxx.com |  1234567890  |     I not awesome     |    everything   |     0     |     none    |  pretty  |
  
  And I am on the "cookie" Edit Role Profile page for the "director" role 
  
#  And my name is "Cookie"
#  And my description is "I eat cookies like a monster in blue paint"
  
Scenario: Editing basic information successfully - change name
  When I fill in "Name" with "My name is now pie"
  And I select Save Changes
  Then I should be on the Edit Role page
  And I should see "Updated successfully"
  And I should see "My name is now pie" in the Name text box
    
Scenario: write a description
  
  When I type "I am apple pie" in the description text box
  And I change my description to "I am awesome"
  And I select Save Changes
  Then I should be on Edit Role page
  And I should see "I am apple pie" in the description field
  
  #TODO need to implement role page view
  
#Scenario: Successful changes (check if: (1) new changes have been saved; (2) old changes are still there; (3) redirects to Role's profile_page
#Scenario: No new changes, cancel editing -- Check If: (1) User is redirected to Role's profile_page
#Scenario: New changes, cancel editing -- Check If: (1) User is redirected to Role's profile_page; (2) the new changes should not have been saved
#Scenario: On the Role's edit_page, make changes, follow a random link (didn't press the "save" button) -- Check If: (1) the new changes should not have been saved
#Scenario: Upload different sized pictures for the profile pic (tentative... on how to handle this...)
