Feature: Default Role

  As a user
  I want to have a default role
  So that I can direct people to the role I want people to see the most?
  
Background:
  Given I am signed in with provider "facebook"
  And the following users exist:
    | uid | provider | nickname | name | token |
    | 12  | facebook | amyykuo  | Amy  | 00000 |
    | 13  | facebook | kmehtaa  | Kol  | 11111 |

  And I have the following roles:
    | role_type  | user_id | role_name | email         | role_type_description | role_experience | role_skills | default_role |
    |  director  |  1      |  John     | test@xxxx.com | I am awesome!         | everything      | none        | true         |
    |   talent   |  1      |  John     | test@xxxx.com | I am awesome!         | everything      | none        | false        |
    |   talent   |  2      |  Amy      | best@xxxx.com | I not awesome         | nothing         | some        | true         |
  
Scenario: Current user goes to other user's homepage, Current user should be redirected to other user's default role page
  When I am on the "amyykuo" home page
  Then I should be on the "amyykuo talent" profile page
