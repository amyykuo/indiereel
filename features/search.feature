#Feature: profile search
  
#  As a user
#  I want to see other users that I may want to collaborate with
#  So that I can make good use of my time in interesting work

#Background: users have been added to database
#  Given the following users exist:
#  | name           | city             | position            |
#  | Amy            | San Diego        | crew                |
#  | Evan           | Huntington Beach | post-production     |
#  | John           | San Francisco    | actor               |
#  | Kunal          | New Jersey       | actor               |
#  | Sylvia         | Irvine           | water boy           |
#  | Jay            | Del Mar          | writer              |
#  | Unicorn        | Rainbow          | magician            |
  
#Scenario: search for a user by name
#    Given I am on the Search page
#    And I select the "Users" button
#    And I type "Amy" in the text box
#    And I press "Submit"
#    Then I should see "Amy"
#    And I should see "San Diego" 
#    And I should see "crew"
    
#Scenario: search for a user by city
#    Given I am on the Search page
#    And I select the "Users" button
#    And I type "San Francisco" in the text box
#    And I press "Submit"
#    Then I should see "John"
#    And I should see "San Francisco" 
#    And I should see "actor"

#Scenario: search for a user by position
#    Given I am on the Search page
#    And I select the "Users" button
#    And I type "actor" in the text box
#    And I press "Submit"
#    Then I should see "John"
#    And I should see "San Francisco" 
#    And I should see "Kunal"
#    And I should see "New Jersey"
#    And I should see "actor"

    
