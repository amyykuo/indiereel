Feature: portfolio view with quickshow

  As a user
  I want to have a portfolio page for each role
  So that I can see all of my media collections

Background:
  Given I am signed in with provider "facebook"
  And I have the following roles:
    | role_type  | user_id | role_name | email         | role_type_description | role_experience | role_skills |
    |  director  |  1      |  John     | test@xxxx.com | I am awesome!         | everything      | none        |
    |   talent   |  1      |  Nguyen   | best@xxxx.com | I not awesome         | nothing         | some        |
    
  And I have the following media collections:
    | description | title |
    | 1           | quickshow          |
    | 2           | headshots          |
    | 3           | Media Collection 1 |
    | 4           | Media Collection 2 |

  And I am on the "tester" Portfolio page for the "talent" role
#  And my "quickshow" album is not empty #not implemented yet

#Scenario: Access Quickshow
#  When I follow "View Collection" within the "Quickshow" section #not yet implemented
#  Then I should be on my "talent" album "quickshow" page #not yet implemented

#Scenario: Access Quickshow edit page
#  When I press "Edit" in the "Quickshow" section #not implemented yet
#  Then I should be on my "talent" album "quickshow" "edit" page #not yet implemented
  
#Scenario: Access Quickshow media file page
#  When I follow "picture" within the "Quickshow" section #not yet implemented
#  Then I should be on my "picture" view page #not yet implemented

#Scenario: Go back to role page #A user should be able to access portfolio page through the role it corresponds to
#  When I follow "Back to your talent page" #not implemented yet
#  Then I should be on my talent page #not implemented yet
#  And I should see my quickshow files in the portfolio section #not implemented yet
