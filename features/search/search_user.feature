#Feature: search by user
  
#  As a user
#  I want to be able to search by user
#  So that I can see the awesome people in IndieReel

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
  
#Scenario: search for a user by stage name
#    And I select the "Users" button
#    And I type "Amy" in the text box
#    And I press "Submit"
#    Then I should see "Amy"
#    And I should see "San Diego" 
#    And I should see "crew"

#Scenario: an inputted stage name does not exist

#Scenario: search for a user by uid, their default page should should up

#Scenario: an inputted uid does not exist
