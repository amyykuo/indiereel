Feature: Public/Private viewing of roles:

  As a user
  I want to have public and private versions of my profile
  So that it looks nice
  
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
    |    crew    |  3      |  Kunz     | kunz@xxxx.com | I suck dick literally | great           | a lot       | true         |
  
  
Scenario: Viewing another person's role (public view)
  When I am on the "amyykuo talent" profile page
  Then I should see "Amy"
  And I should see "I not awesome"
  But I should not see "Edit"

Scenario: Viewing your own profile in all fields mode (private view)
  When I am on my "tester director" profile page
  Then I should see "John"
  And I should see "I am awesome!"
  And I should see "Edit"
  And I should see "Delete"
  And I should see "View as Public Profile"
  And I should see "Agency Name:"

Scenario: Viewing your own profile in preview mode (private view, preview mode)
  When I am on my "tester director" profile page
  Then I should see "Agency Name:"
  Then I follow "View as Public Profile"
  And I should not see "Agency Name:"
  Then I follow "View All Fields"
  And I should see "Agency Name:"

