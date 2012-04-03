Feature: Edit Role Profile page

  As a User
  I want to be able to edit my role profile
  So that I can keep my information up to date

Background:

  Given I am on the "cookie" Edit Role Profile page for the "director" role 
  And I have a RottenPotatoes project
  And my name is "Cookie"
  And my description is "I eat cookies like a monster in blue paint"
  
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
