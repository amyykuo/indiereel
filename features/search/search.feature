#Feature: profile search
  
#  As a user
#  I want to see other users that I may want to collaborate with
#  So that I can make good use of my time in interesting work

#Background: users have been added to database
#  Given the following users exist:
#  | name           | city             | position            |
#  | Amy            | San Diego        | crew                |
#  | Evan           | Huntington Beach | crew                |
#  | John           | San Francisco    | talent              |
#  | Kunal          | New Jersey       | talent              |
#  | Sylvia         | Irvine           | producer            |
#  | Jay            | Del Mar          | director            |
#  | Unicorn        | Rainbow          | director            |

#  And I am on the Search page
  
#Scenario: search for a user by name
#    When I select the "Users" button
#    And I type "Amy" in the text box
#    And I press "Submit"
#    Then I should see "Amy"
#    And I should see "San Diego" 
#    And I should see "crew"
    
#Scenario: search for a user by city
#    When I select the "Users" button
#    And I type "San Francisco" in the text box
#    And I press "Submit"
#    Then I should see "John"
#    And I should see "San Francisco" 
#    And I should see "actor"

#Scenario: search for a user by position
#    When I select the "Users" button
#    And I type "actor" in the text box
#    And I press "Submit"
#    Then I should see "John"
#    And I should see "San Francisco" 
#    And I should see "Kunal"
#    And I should see "New Jersey"
#    And I should see "actor"
