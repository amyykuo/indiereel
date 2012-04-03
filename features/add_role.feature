Feature: Add a role profile

  As a multi-talented individual
  I want to be able to have multiple role profiles
  So that I represent each of my talents explicitly

Background:

  Given I am on the "amyykuo" home page
  And I have a director role profile
  And I have an actor role profile
  And my name is "Helen"
  
Scenario: Adding a Producer role successfully - change name
  When I click on the New Profile button
  Then I should be on the create role page
  When I click on the Role dropdown button
  And I should see "producer"
  But I should not see "actor"
  And I click on the producer option  
  And I put "HelenBoss" in the name text box
  And I click on "submit"
  Then I should be on my new Talent profile page
  
Scenario: Try creating a role profile without filling out the name text field
  When I click on the New Profile button
  Then I should be on the create role page
  When I click on the Role dropdown button
  And I click on the crew option
  And I click on "submit"
  Then I should be on the create role page
  And I should see the "need to fill out the name field"
  
Scenario: Try creating a role profile without choosing a role
  When I click on the New Profile button
  Then I should be on the create role page
  And I put "HelenBoss" in the name text box
  And I click on "submit"
  Then I should be on the create role page
  And I should see the "need to fill out the name field"
