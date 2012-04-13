Feature: Media Collection page

  As a User
  I want to be able to see and add media files to my media collection
  So that I can organize it and stuff

Background:

  Given I am signed in with provider "facebook"
  And I have the following roles:
  | role_type  | user_id | role_name |     email     | phone_number | role_type_description | role_experience | age_range | role_skills | physique |
  |  director  |    1    |   John    | test@xxxx.com |  1234567890  |     I am awesome!     |    everything   |     0     |     none    |  pretty  |
  |   talent   |    1    |  Nguyen   | best@xxxx.com |  1234567890  |     I not awesome     |      nothing    |     1     |     same    |   ugly   |
  
  And I have the following media collections:
  # not implemented yet
  And I am on the "talent" media collection "photos" page # not implemented yet
  
Scenario: User should be able to upload a media file (picture, video, song, etc) #not quite sure how this will work yet
  When I upload a new picture # not implemented yet
  And I press "submit" # not implemented yet
  Then I should be on the "talent" media collection "photos" page # not implemented yet
  And I should see my new picture # not implemented yet

Scenario: #User should be able to embed youtube videos

Scenario: #User should be able to delete a media file
  When I press "delete the dog picture" # not implemented yet
  Then I should be on the "talent" media collection "photos" page # not implemented yet
  And I should not see the dog picture anymore # not implemented yet

Scenario: #User should be able to Cancel, redirects to MC page

Scenario: #User should be able to Submit changes, saves changes and redirects to MC page

