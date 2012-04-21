Feature: Edit Media Collection page

  As a User
  I want to be able to edit my media collection
  So that I can organize it and stuff

Background:

  Given I am signed in with provider "facebook"
  And I have the following roles:
  | role_type  | user_id | role_name |     email     | phone_number | role_type_description | role_experience | age_range | role_skills | physique |
  |  director  |    1    |   John    | test@xxxx.com |  1234567890  |     I am awesome!     |    everything   |     0     |     none    |  pretty  |
  |   talent   |    1    |  Nguyen   | best@xxxx.com |  1234567890  |     I not awesome     |      nothing    |     1     |     same    |   ugly   |
  
  And I have the following albums:
  | role_id | title | description          |
  | 1       | What  | these are mine       |
  | 2       | Who   | Where?               |
  
  And I am on the "tester" "director" media collection "1" edit page
  #And I should see "these are mine" within the "mc_title" section
  
Scenario: Edit the description of the MC successfullly
  When I fill in "mc_description" with "these are my new photos"
  And I press "Update Album"
  Then I should be on my "tester" "1" media collection page for the "director" role
  And I should see "these are my new photos"
  But I should not see "these are mine"

Scenario: Edit the name of the MC, submit, see new title of the MC
  When I fill in "mc_title" with "new photos"
  And I press "Update Album"
  Then I should be on my "tester" "1" media collection page for the "director" role
  And I should see "new photos"
  But I should not see "What"

Scenario: User should be able to Cancel, redirects to MC page
  When I fill in "mc_description" with "these are my new photos"
  And I follow "Cancel"
  Then I should be on my "tester" "1" media collection page for the "director" role
  And I should not see "these are my new photos"
  But I should see "these are mine"
  
Scenario: unsuccessfully edit MC
  When I fill in "mc_title" with ""
  And I press "Update Album"
  Then I should be on the "tester" "director" media collection "1" edit page
  And I should see "You've got to give your album a name!"
  
Scenario: #A User should be able to delete the media collection
  When I press "Delete Album"  #not implemented yet
  Then I should be on my portfolio page  #not implemented yet
