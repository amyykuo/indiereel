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
  #And my "quickshow" album is empty #not implemented yet
