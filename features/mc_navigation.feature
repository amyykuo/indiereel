Feature: Media Collection page

As a User
I want to be able to have full access all my media files in a media collection
So I can see them

Background:
  Given I am signed in with provider "facebook"
  
  And I have the following roles:
  | role_type  | user_id | role_name | profile_pic            | email         | role_type_description | role_experience | role_skills |
  |  director  |  1      |  John     | http://hi.com/user.png | test@xxxx.com | I am awesome!         | everything      | none        |
  |   talent   |  1      |  Nguyen   | http://pi.com/user.png | best@xxxx.com | I not awesome         | nothing         | some        |
    
  And I have the following media collections:
  #have not implemented yet
  And I am on my "talent" media collection titled "photos" page # not implemented yet
  
Scenario: Go back to portfolio page #A user should be able to access portfolio page through any of its media collections
  When I follow "Go back to Portfolio" # not implemented yet
  Then I should be on my portfolio page # not implemented yet

Scenario: #A user should be able to access the edit page for a media collection
  When I follow "Edit this MC"  # not implemented yet
  Then I should be on my "talent" edit media collection "photos" page  # not implemented yet
  
Scenario: #A User should be able to delete the media collection
  When I press "delete"  # not implemented yet
  Then I should be on my portfolio page  # not implemented yet
  And I should not see media collection "Photos"  # not implemented yet

Scenario: #User should be able to see all media files
  # need to figure out if we want to test this in cuke or rspec...
  
Scenario: See a media file page # user should be able to see each media file individually
  When I follow "photo1"  # not implemented yet
  Then I should be on "photo1" view page  # not implemented yet
  
