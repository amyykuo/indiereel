Feature: Add a role profile

  As a multi-talented individual
  I want to be able to have multiple role profiles
  So that I represent each of my talents explicitly

Background:

  Given I am on my "amyykuo" home page
#  And I have a director role profile
#  And I have an actor role profile

# not implemented (does not guarantee it works)
  
Scenario: Adding a Producer role successfully
#  need to put a table
#  When I click on the New Profile button
  Then I should be on the Create Role Page
#  When I click on the Role dropdown button
#  And I should see "producer"
#  But I should not see "actor"
#  And I click on the producer option  
#  And I put "HelenBoss" in the name text box
  And I click on "submit"
  Then I should be on my "amyykuo talent" profile page

Scenario: Trying to create a Role Profile with no role type selected
#  need to put a table
#  When I click on the New Profile button
  Then I should be on the Create Role Page
#  When I do not select a role
  And I click on "submit"
  Then I should be on the Create Role Page
  And the "Select a Role" field should have the error "You need to select a role"
  
Scenario: Trying to create a Role Profile when all roles have already been created
#  need to put a table
#  When I click on the New Profile button
  Then I should be on the Create Role Page
#  When I do not select a role
  And I click on "submit"
  Then I should be on the Create Role Page # or should it redirect to home page?
  And the "Select a Role" field should have the error "You cannot create anymore roles"
  # or
  # Then I should be on my "amyykuo" home page
  # And I should see "You cannot create anymore role profiles. Give your other roles more love :D"

Scenario: Create a role and create_role_options should update properly
# When I create a producer profile
# And I go to the Create Role Page
# Then I should on see ...

Scenario: On the Create Role Page, select a role but don't input data, and cancel
#  When I click on the New Profile button
  Then I should be on the Create Role Page
# When I select a role
#  And I click on "cancel"
  Then I should be on my "amyykuo" home page
#  And I should not see "whatever role I selected"
#  But I should see my current roles

Scenario: On the Create Role Page, do not select a role, don't input data, and cancel
#  When I click on the New Profile button
  Then I should be on the Create Role Page
#  And I click on "cancel"
  Then I should be on my "amyykuo" home page
#  And I should see my current roles

Scenario: On the Create Role Page, input data, and cancel
#  When I click on the New Profile button
  Then I should be on the Create Role Page
# When I select a role
# And I input data
#  And I click on "cancel"
  Then I should be on my "amyykuo" home page
#  And I should not see "whatever role I selected"
  

# don't need this?  
#Scenario: Try creating a role profile without filling out the name text field
#  When I click on the New Profile button
#  Then I should be on the Create Role Page
#  When I click on the Role dropdown button
#  And I click on the crew option
#  And I click on "submit"
#  Then I should be on the Create Role Page
#  And I should see "need to fill out the name field"
  
