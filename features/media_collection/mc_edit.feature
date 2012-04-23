Feature: media collection edit page

  As a user
  I want to be able to edit my media collection
  So that I can organize it and stuff

Background:
  Given I am signed in with provider "facebook"
  And I have the following roles:
  | role_type  | user_id | role_name |     email     | role_type_description | role_experience | age_range | role_skills |
  |  director  |    1    |   John    | test@xxxx.com |     I am awesome!     |    everything   |     0     |     none    |
  |   talent   |    1    |  Nguyen   | best@xxxx.com |     I not awesome     |      nothing    |     1     |     same    |
  
  And I have the following albums:
  | role_id | title       | description          |
  | 1       | quickshow   | these are mine       |
  | 2       | headshots   | Where?               |
  | 1       | What        | these are mine       |
  | 2       | Who         | Where?               |
  
  And I am on the "tester" "director" media collection "what" edit page
  #And I should see "these are mine" within the "mc_title" section
  
  
Scenario: Edit the description of the MC successfullly
  When I fill in "media_collection_description" with "these are my new photos"
  And I press "Update Media collection"
  Then I should be on my "tester" "what" media collection page for the "director" role
  And I should see "these are my new photos"
  But I should not see "these are mine"

Scenario: Edit the name of the MC, submit, see new title of the MC
  When I fill in "media_collection_title" with "new photos"
  And I press "Update Media collection"
  Then I should be on my "tester" "new-photos" media collection page for the "director" role
  And I should see "new photos"
  But I should not see "What"

Scenario: User should be able to Cancel, redirects to portfolio page
  When I fill in "media_collection_description" with "these are my new photos"
  And I follow "Cancel"
  Then I should be on my "tester director" portfolio page
  
Scenario: unsuccessfully edit MC
  When I fill in "media_collection_title" with ""
  And I press "Update Media collection"
  Then I should be on the "tester" "director" media collection "what" edit page
  And I should see "You've got to give your album a name!"
  
#Scenario: A User should be able to delete the media collection
#  And I should see "Delete"
#  When I follow "Delete"
#  Then I should be on my "tester director" portfolio page
