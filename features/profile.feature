Feature: Creating and editing profile page for a user
 
  As an Actor
  I want to build a profile
  So that others can see my awesomeness
  
Background: User is connected through Facebook

  Given I am on the IndieReel home page

Scenario: make a Talent profile page

    When I click on the New Profile button
    And I click on the Role dropdown button
    And I click on the Talent option
    Then I should be on my new Talent profile page

Scenario: add my name

    When I am on my Talent profile page
    And I click on edit info
    Then I should be on my Edit Talent profile page
    And I change my name to "Bob"
    And I click on save
    Then I should be on my Talent profile page
    And I should see Bob in the name field

Scenario: edit my name

    When I am on my Talent profile page
    And I click on edit info
    Then I should be on my Edit Talent profile page
    And I should see "Bob"
    But I should not see "Cat"
    Then I change my name to "Cat"
    And I click on save
    Then I should be on my Talent profile page
    And I should see "Cat" in the name field
    But I should not see "Bob" in the name field
    
Scenario: write a description
    
    When I am on my Talent profile page
    And I click on edit info
    Then I should be on my Edit Talent profile page
    And I change my description to "I am awesome"
    And I click on save
    Then I should be on my Talent profile page
    And I should see "I am awesome" in the description field
