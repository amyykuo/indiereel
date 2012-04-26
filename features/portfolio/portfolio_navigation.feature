Feature: portfolio view without quickshow

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

Scenario: Go create a MC
  When I follow "+ Add Album?"
  Then I should be on the "talent" media collection create page
  When I fill in "media_collection_title" with "fat"
  And I press "Create Album"
  Then I should be on my "tester" "fat" media collection page for the "talent" role
  
Scenario: Access an MC page
  When I follow "What" within the "What" section
  Then I should be on my "tester" "what" media collection page for the "director" role
  
Scenario: Access an MC edit page
  When I follow "Edit Album" within the "What" section
  And I am on the "tester" "talent" media collection "what" edit page

Scenario: Go back to role page #A user should be able to access portfolio page through the role it corresponds to
  When I follow "Back to Talent"
  Then I should be on my "tester talent" profile page
