Feature: Add a role profile

  As a multi-talented individual
  I want to be able to have multiple role profiles
  So that I represent each of my talents explicitly

Background:

  Given I am on my "tester" home page

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

Scenario: On the Create Role Page, do not select a role, don't input data, and cancel
#  When I click on the New Profile button
  Then I should be on the Create Role Page
#  And I click on "cancel"
  Then I should be on my "amyykuo" home page
#  And I should see my current roles

Scenario: Create a role and create_role_options should update properly
# When I create a producer profile
# And I go to the Create Role Page
# Then I should on see ...
