Feature: media collection page navigation

  As a user
  I want to be able to have full access all my media files in a media collection
  So I can see them

Background:
  Given I am signed in with provider "facebook"
  And I have the following roles:
  | role_type  | user_id | role_name | email         | role_type_description | role_experience | role_skills |
  |  director  |  1      |  John     | test@xxxx.com | I am awesome!         | everything      | none        |
  |   talent   |  1      |  Nguyen   | best@xxxx.com | I not awesome         | nothing         | some        |
    
  And I have the following albums:
  | role_id | title       | description          |
  | 1       | quickshow   | these are mine       |
  | 2       | headshots   | Where?               |
  | 1       | What        | these are mine       |
  | 2       | Who         | Where?               |
  
  And I am on my "tester" "what" media collection page for the "director" role
  
Scenario: Go back to portfolio page #A user should be able to access portfolio page through any of its media collections
  When I follow "Back to Portfolio"
  Then I should be on the "tester" Portfolio page for the "director" role

Scenario: Go to a media collection edit page #A user should be able to access the edit page for a media collection
  When I follow "Edit this Album"
  Then I should be on the "tester" "director" media collection "what" edit page

Scenario: A User should be able to delete the media collection
  When I follow "Delete"
  Then I should be on the "tester" Portfolio page for the "director" role
  And I should not see "What"

#Scenario: See a media file page #user should be able to see each media file individually
#  When I follow a media link "media" #not yet implemented
#  Then I should be on the media display page of the "photos" album #not yet implemented
#  And the "media.file" of "photos" should be "true" #not yet implemented
#  And the "media_file_size" of "photos" should not be blank #not yet implemented
