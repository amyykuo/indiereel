#Feature: profile search
  
#  As a user
#  I want to see other users with a specific role
#  So that I can find someone with a certain skill I need

#Background: users have been added to database
#  Given the following users exist:
#  | stage_name     | location         | role_type           |
#  | Amy            | San Diego        | crew                |
#  | Evan           | Huntington Beach | crew                |
#  | John           | San Francisco    | talent              |
#  | Kunal          | New Jersey       | talent              |
#  | Sylvia         | Irvine           | producer            |
#  | Jay            | Del Mar          | director            |
#  | Unicorn        | Rainbow          | director            |

#  And I am on the Search page

#Scenario: search for a user by role
#    When I select the "Users" button
#    And I type "talent" in the text box
#    And I press "Submit"
#    Then I should see "John"
#    And I should see "San Francisco" 
#    And I should see "Kunal"
#    And I should see "New Jersey"
#    And I should see "talent"
