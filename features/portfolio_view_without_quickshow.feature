Feature: Portfolio Page

As a User
I want to have a portfolio page for each role
So that I can see all of my media collections

Background:
  Given I am signed in with provider "facebook"
  
  And I have the following roles:
  | role_type  | user_id | role_name | profile_pic            | email         | role_type_description | role_experience | role_skills |
  |  director  |  1      |  John     | http://hi.com/user.png | test@xxxx.com | I am awesome!         | everything      | none        |
  |   talent   |  1      |  Nguyen   | http://pi.com/user.png | best@xxxx.com | I not awesome         | nothing         | some        |
    
  And I have the following media collections:
  #have not implemented yet
  And I am on my "talent" portfolio page # not implemented yet


Scenario: Go create a MC
  When I press "Add Collection?" #not yet implemented
  Then I should be on the "talent" new media collection page #not yet implemented

Scenario: Go delete an MC
  When I press "Delete" within the "Media Collection 1" section #not yet implemented
  Then I should be on my "talent" portfolio page #not yet implemented
  And I should not see "Media Collection 1" #not yet implemented
  But I should see "Media Collection 2" #not yet implemented
  
Scenario: Access an MC page
  When I follow "View Collection" within the "Media Collection 1" section #not yet implemented
  Then I should be on my "talent" album "1" page #not yet implemented
  
Scenario: Access an MC edit page
  When I press "Edit" within the "Media Collection 1" section #not yet implemented
  Then I should be on my "talent" album "1" "edit" page #not yet implemented

Scenario: Go back to role page #A user should be able to access portfolio page through the role it corresponds to
  When I follow "Back to your talent page" # not implemented yet
  Then I should be on my talent page # not implemented yet

