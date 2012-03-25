Feature: Edit Role Profile page

  Background:
  Given that I am on the Edit Role Profile page for the Director role 
  And I have a RottenPotatoes project
  And I have a Bloop portfolio
  And I have a Blee gallery in the Bloop portfolio
  And my name is "Cookie"
  And my description is "I eat cookies like a monster in blue paint"
  
  Scenario: Editing basic information successfully - change name
  When I type "My name is now pie" in the Name text box
  And I select Save Changes
  Then I should be on the Edit Role page
  And I should see "Updated successfully"
  And I should see "My name is now pie" in the Name text box
  
  Scenario: Deleting a project
  When I select "Delete project" for the RottenPotatoes project
  Then I should be on the Edit Role page
  And I should see "Deleted successfully"
  And I should not see "RottenPotatoes"
  
  Scenario: Adding a gallery
  
  Scenario: Deleting a gallery
  When I select "Delete gallery" for the Blee gallery
  Then I should be on the Edit Role page
  And I should see "Deleted successfully"
  And I should not see "Blee"
  And the Bloop portfolio should be empty
  
  
