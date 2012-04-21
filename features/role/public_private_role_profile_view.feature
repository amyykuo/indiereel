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

    
  
  
Scenario: Viewing another person's role
  

Scenario: Viewing your own profile in all fields mode
  

Scenario: Viewing your own profile in preview mode
  

