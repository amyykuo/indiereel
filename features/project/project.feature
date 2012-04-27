#Feature: Create a project and display its details
 
#  As a Director
#  I want to build a profile for my project
#  So that others can see and join my project

#Background: project profile has been made, needs editing
#    Given the following projects exist:
#    | name           | owner       | location            | description     |
#    | Chocolate      | Amy         | San Diego           | bloop project   |
#    | Sprinkle       | Sylvia      | San Marcos          | blah project    |
#    | Frosting       | Amy         | San Fernando Valley |                 |
    
#    Given I am on the IndieReel home page
#    And I am logged in as "Amy"

#Scenario: Go to projects page
#    When I follow "Projects" 
#    Then I should be on the Projects page
#    And I should see "Chocolate"
#    And I should see "Frosting"
#    But I should not see "Sprinkle"

#Scenario: Edit project name
#    When I follow "Projects"
#    And I select "Chocolate"
#    And I select the "Edit Project" button 
#    And I type "Vanilla" in the "Name" text box
#    And I select the "Submit" button
#    Then I should be on the Projects page
#    And I should see "Vanilla"
#    And I should see "San Diego"
#    And I should see "bloop project"
#    But I should not see "Chocolate"

#Scenario: Write project description
#    When I follow "Projects"
#    And I select "Frosting"
#    And "project_description" is ""
#    And I select the "Edit Project" button
#    And I type "blergh project" in the "Description" text box
#    And I select the "Submit" button
#    Then I should be on the Projects page
#    And I should see "Frosting"
#    And I should see "San Fernando Valley"
#    And I should see "blergh project"
    
#Scenario: Add a project
#    When I follow "Projects"
#    And I select the "Add Project" button
#    And I am on the Add Project page
#    And I type "Custard" in the "Name" text box
#    And I type "San Francisco" in the "Location" text box
#    And I type "blip project" in the "Description" text box
#    And I select the "Submit" button
#    Then I should be on the Projects page
#    And I should see "Custard"
#    And I should see "San Francisco"
#    And I should see "blip project"
    

#<-- THIS IS JUST AN IDEA BUT NOT THE FOCUS OF OUR APP SO KEEPING IT ON HOLD-->
#Scenario: add a collaborator
#    Given I am on the project's page
#    And "collaborators" is empty
#    Click on "edit_project"
#    Enter "Test Name" in "project_collaborators"
#    Click "submit"
#    The "project_collaborators" field should be "Test Name"
