@search
Feature: profile search
  
  As a user
  I want to see other users that I may want to collaborate with
  So that I can make good use of my time in interesting work

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
  |   talent   |  4      |  John     | test@xxxx.com | false        | Berkeley      |

  And I am on the Search page
  
  
Scenario: no search input
    When I uncheck the following roles: talent, director, crew, producer
    And I fill in "query" with ""
    And I press "Search"
    Then I should not see "Results"
    
Scenario: check boxes only
    When I check the following roles: talent, director, crew, producer
    And I fill in "query" with ""
    And I press "Search"
    Then I should see "Results"

Scenario: query only
    When I uncheck the following roles: talent, director, crew, producer
    And I fill in "query" with "Amy"
    And I press "Search"
    Then I should see "Results"

Scenario: both check boxes and query
    When I check the following roles: talent, director, crew, producer
    And I fill in "query" with "Amy"
    And I press "Search"
    Then I should see "Results"
