Feature: search by user
  
  As a user
  I want to be able to search by user
  So that I can see the awesome people in IndieReel

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
  
  
Scenario: search for a user by stage name, with role specified
    When I check the following roles: check1
    When I uncheck the following roles: check2, check3, check4
    And I fill in "query" with "John"
    And I press "Search"
    Then I should see "John"
    And I should see "Talent"
    And I should see "San Francisco"
    But I should not see "Director"
    And I should not see "Berkeley"
    
Scenario: search for a user by stage name, with no role specified
    When I uncheck the following roles: check1, check2, check3, check4
    And I fill in "query" with "John"
    And I press "Search"
    Then I should see "John"
    And I should see "Talent"
    And I should see "San Francisco"
    And I should see "Director"
    And I should see "Berkeley"

Scenario: an inputted stage name does not exist, with role specified
    When I check the following roles: check1
    When I uncheck the following roles: check2, check3, check4
    And I fill in "query" with "Oversized Hippo"
    And I press "Search"
    Then I should see "Your query returned no results."
    
Scenario: an inputted stage name does not exist, with no role specified
    When I uncheck the following roles: check1, check2, check3, check4
    And I fill in "query" with "Oversized Hippo"
    And I press "Search"
    Then I should see "Your query returned no results."
    
#Scenario: search for a user by uid, their default page should should up

#Scenario: an inputted uid does not exist
