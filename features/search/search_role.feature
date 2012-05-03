@search
Feature: profile search
  
  As a user
  I want to see other users with a specific role
  So that I can find someone with a certain skill I need

Background: users have been added to database

  Given I am signed in with provider "facebook"
  
  And the following users exist:
  | uid | provider | nickname | name | token |
  | 12  | facebook | amyykuo  | Amy  | 00000 |
  | 13  | facebook | kmehtaa  | Kol  | 11111 |
  | 14  | facebook | johnguy  | jon  | 22222 |
  
  And I have the following roles:
  | role_type  | user_id | role_name | email         | default_role | location      |
  |   talent   |  2      |  Amy      | best@xxxx.com | true         | San Diego     |
  |    crew    |  3      |  kunz     | kunz@xxxx.com | true         | New Jersy     |
  |  director  |  4      |  John     | test@xxxx.com | true         | Berkeley      |
  |   talent   |  4      |  John     | test@xxxx.com | false        | San Francisco |

  And I am on the Search page


Scenario: search for a user by role ONLY
    When I check the following roles: talent
    When I uncheck the following roles: director, crew, producer
    And I fill in "query" with ""
    And I press "Search"
    Then I should see "John"
    And I should see "San Francisco" 
    And I should see "Amy"
    And I should see "San Diego"
    And I should see "Talent"
    But I should not see "kunz@xxxx.com"
    And I should not see "kunz"
