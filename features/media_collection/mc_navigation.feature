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
  | role_id | title | description          |
  | 1       | What  | these are mine       |
  | 2       | Who   | Where?               |
  
  #And I am on my "tester" "What" media collection page for the "talent" role
  
#Scenario: Go back to portfolio page #A user should be able to access portfolio page through any of its media collections
  #When I follow "Back to Talent"
  #Then I should be on the "tester" Portfolio page for the "talent" role

#Scenario: Go to a media collection edit page #A user should be able to access the edit page for a media collection
  #When I follow "Edit Album" in the "Media Collection 1"   #not implemented yet
  #Then I should be on my "talent" edit media collection "photos" page  # not implemented yet

#Scenario: #User should be able to see all media files
  #need to figure out if we want to test this in cuke or rspec...
#  When I am on my "talent" media collection "photos" page #not yet implemented
#  Then I should see "media" #not yet implemented
  
#Scenario: See a media file page #user should be able to see each media file individually
#  When I follow a media link "media" #not yet implemented
#  Then I should be on the media display page of the "photos" album #not yet implemented
#  And the "media.file" of "photos" should be "true" #not yet implemented
#  And the "media_file_size" of "photos" should not be blank #not yet implemented
