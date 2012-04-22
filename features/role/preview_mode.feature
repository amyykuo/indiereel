Feature: Preview Mode

  As a user
  I want to have a preview mode of my role profiles
  So that I can see how other user's see my pages
  
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

# the testing for this is really sketch and it sucks. very unstable and not sure if it even tests it right

Scenario: User is not on preview mode and goes to preview mode
  When I am on my "tester talent" profile page
  And I should see "Phone:"
  And I follow "Preview"
  Then I should be on the preview of my "tester talent" profile # this line. its terrible. 
  And I should see "test@xxxx.com"
  But I should not see "Phone"
  
Scenario: User is on preview mode and goes back to normal view
  When I am on the preview of my "tester talent" profile
  And I should not see "Phone"
  And I follow "View All Fields"
  Then I am on my "tester talent" profile page
  And I should see "Phone"
