Feature: Media Collection Create page

As a User
I want to be able to create media collections
So that I can show my new works

Background:
  Given I am signed in with provider "facebook"
  
  And I have the following roles:
  | role_type  | user_id | role_name | profile_pic            | email         | role_type_description | role_experience | role_skills |
  |  director  |  1      |  John     | http://hi.com/user.png | test@xxxx.com | I am awesome!         | everything      | none        |
  |   talent   |  1      |  Nguyen   | http://pi.com/user.png | best@xxxx.com | I not awesome         | nothing         | some        |
    
  And I have the following media collections:
  #have not implemented yet
  And I am on my "talent" media collection create page # not implemented yet
  
Scenario: Successfully create a MC #A user should be able to access portfolio page through any of its media collections
  When I fill in "title" with "photoshoot"  # not implemented yet
  And I fill in "description" with "this was awesome" # not implemented yet
  And I press "submit" # not implemented yet
  Then I should be on my "photoshoot" media collection page # not implemented yet
  And I should see "photoshoot" # not implemented yet
  And I shoud see "this was awesome" # not implemented yet

Scenario: Successfully cancel
  When I fill in "title" with "photoshoot" # not implemented yet
  And I press "cancel" # not implemented yet
  Then I should be on my "talent" portfolio page # not implemented yet

Scenario: Get redirected when user doesn't fill in title field
  When I fill in "description" with "this is not awesome" # not implemented yet
  And I press "submit" # not implemented yet
  Then I should be on my "talent" media collection create page # not implemented yet
  And I should see the error "you need to give the MC a title" # not implemented yet
