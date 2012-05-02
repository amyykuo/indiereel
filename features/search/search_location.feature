@search
Feature: search by location
  
  As a user
  I want to be able to search by location
  So that I can see the awesome people near my location

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

Scenario: search for a user by city #talent, director, crew, producer
    When I check the following roles: check1, check2, check3, check4
    And I fill in "query" with "Berkeley"
    And I press "Search"
    Then I should see "John"
    And I should see "Berkeley"
    And I should see "Talent"
    And I should see "Director"
    But I should not see "Amy"
    And I should not see "kunz"

Scenario: an inputted location does not exist #talent, director, crew, producer
    When I check the following roles: check1, check2, check3, check4
    And I fill in "query" with "Over the Rainbow"
    And I press "Search"
    Then I should see "Your query returned no results."
