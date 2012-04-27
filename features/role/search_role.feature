#Feature: search by location
  
#  As a user
#  I want to be able to search by location
#  So that I can see the awesome people near my location

#Background: users have been added to database

#  Given I am signed in with provider "facebook"
#  And the following users exist:
#  | name           | city             | position            |
#  | Amy            | San Diego        | crew                |
#  | Evan           | Huntington Beach | crew                |
#  | John           | San Francisco    | talent              |
#  | Kunal          | New Jersey       | talent              |
#  | Sylvia         | Irvine           | producer            |
#  | Jay            | Del Mar          | director            |
#  | Unicorn        | Rainbow          | director            |

#  And I am on the Search page

#Scenario: search for a user by position
#    When I select the "Users" button
#    And I type "actor" in the text box
#    And I press "Submit"
#    Then I should see "John"
#    And I should see "San Francisco" 
#    And I should see "Kunal"
#    And I should see "New Jersey"
#    And I should see "actor"  
