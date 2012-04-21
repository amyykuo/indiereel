Feature: Media Collection page #needs change once page is more implemented

  As a user
  I want to be able to see and add media files to my media collection
  So that I can organize it and stuff

Background:
  Given I am signed in with provider "facebook"
  And I have the following roles:
    | role_type  | user_id | role_name |     email     | role_type_description | role_experience | age_range | role_skills | physique |
    |  director  |    1    |   John    | test@xxxx.com |     I am awesome!     |    everything   |     0     |     none    |  pretty  |
    |   talent   |    1    |  Nguyen   | best@xxxx.com |     I not awesome     |      nothing    |     1     |     same    |   ugly   |
  
  And I have the following media collections:
    | description | title |
    | 1           | quickshow          |
    | 2           | headshots          |
    | 3           | Media Collection 1 |
    | 4           | Media Collection 2 |
  
  And I am on the "talent" media collection "photos" page #not implemented yet
  
  
Scenario: User should be able to upload a media file (picture, video, song, etc) #not quite sure how this will work yet
  When I upload a new picture #not implemented yet
  And I press "submit" #not implemented yet
  Then I should be on the "talent" media collection "photos" page #not implemented yet
  And I should see my new picture #not implemented yet

Scenario: #User should be able to embed youtube videos
  When I fill in "embed video" with "http://youtu.be/LkCNJRfSZBU" #not implemented yet
  And I press "embed" #not implemented yet
  Then I should be on the "talent" media collection "photos" page #not implemented yet
  And I should see my new video embedded #not implemented yet

Scenario: #User should be able to delete a media file
  When I press "delete the dog picture" #not implemented yet
  Then I should be on the "talent" media collection "photos" page #not implemented yet
  And I should not see the dog picture anymore #not implemented yet

Scenario: #User should be able to Submit changes, saves changes and redirects to MC page
#Note from Evan - I don't think this is necessary if the collection updates dynamically when a user uploads a file or embeds a video

