#Feature: search by location
  
#  As a user
#  I want to be able to search by location
#  So that I can see the awesome people near my location

#Background: users have been added to database

#  Given I am signed in with provider "facebook"
#  And the following users exist:
#  | stage_name     | location         | role_type           |
#  | Amy            | San Diego        | crew                |
#  | Evan           | Huntington Beach | crew                |
#  | John           | San Francisco    | talent              |
#  | Kunal          | New Jersey       | talent              |
#  | Sylvia         | Irvine           | producer            |
#  | Jay            | Del Mar          | director            |
#  | Unicorn        | Rainbow          | director            |

#  And I am on the Search page
  
#Scenario: search for a user by city
#    When I select the "Users" button
#    And I type "San Francisco" in the text box
#    And I press "Submit"
#    Then I should see "John"
#    And I should see "San Francisco" 
#    And I should see "talent"

#Scenario: an inputted location does not exist
  
