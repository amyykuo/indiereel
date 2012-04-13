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
  
  And I have the following media collections:
  # not implemented yet
  And I am on the "talent" media collection "photos" edit page # not implemented yet
  
Scenario: Edit the description of the MC successfullly
  When I fill "description" with "these are my new photos" # not implemented yet
  And I press "submit" # not implemented yet
  Then I should be on the "talent" media collection "photos" page # not implemented yet
  And I should see "these are my new photos" in the description section # not implemented yet
  But I should not see "these are mine" in the description section # not implemented yet

Scenario: Edit the name of the MC, submit, see new title of the MC
  When I fill "title" with "new photos" # not implemented yet
  And I press "submit" # not implemented yet
  Then I should be on the "talent" media collection "new photos" page # not implemented yet
  And I should see "new photos" # not implemented yet
  But I should not see "photos" # not implemented yet
  And I should not be on the "talent" media collection "photos" page # not implemented yet

Scenario: #User should be able to Cancel, redirects to MC page
  When I fill "description" with "these are my new photos" # not implemented yet
  And I press "cancel" # not implemented yet
  Then I should be on the "talent" media collection "new photos" page # not implemented yet
  And I should not see "these are my new photos"

