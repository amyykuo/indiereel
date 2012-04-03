Feature: Home page

  Background:
  Given that I am on the "Amy" home page
  And I have the Director role
  And I have the Actor role

    Scenario: Adding a role successfully
    When I select the "Add Role" button
    And a confirmation box saying "Choose a role"
    And I select the Producer role
    And I select "Submit"
    Then I should be on the the Edit Role page
    And my role should be Producer
    
#    Scenario: Try adding a role that already exists
#    When I select the "Add Role" button
#    And a confirmation box saying "Choose a role"
#    And I should see "Post"
#    But I should not "Director"

    Scenario: Try making a role without having any roles selected
    When I select the "Add Role" button
    And a confirmation box opens saying "Choose a role"
    But I do not select a role
    And I select "Submit"
    Then I should see "A role must be selected to create a new role profile"

    Scenario: Deleting a role successfully
    When I select the "Delete Role" button for the Director role
    And a confirmation box saying "Click ok to confirm"
    And I select "Ok"
    Then I should be on the "Amy" home page
    And I should not see Director

    Scenario: Editing a role
    When I select the "Edit Role" button for the Director role
    Then I should be on the "Director" Edit Role page
