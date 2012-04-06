Feature: Add a role profile

  As a multi-talented individual
  I want to be able to have multiple role profiles
  So that I represent each of my talents explicitly

Background:

  Given I am signed in with provider "facebook"
  And I have the following roles:
  | role_type  | user_id | role_name | profile_pic            | email         | role_type_description | role_experience | role_skills |
  |  director  |  1      |  John     | http://hi.com/user.png | test@xxxx.com | I am awesome!         | everything      | none        |
  |   talent   |  1      |  Nguyen   | http://pi.com/user.png | best@xxxx.com | I not awesome         | nothing         | some        |
    
  And I am on my "tester" home page

Scenario: Adding a Producer role successfully
  When I follow "Add a role"
  Then I should be on the Create Role Page
#  And the "role_type" dropdown should contain: producer, crew
#  And the "role_type" field should contain "producer"#  And the "role_type" field should contain "crew" FIX THIS
  When I select "producer" from "role_type"
#  And I should see "Create Role."
  When I press "Create role."
  Then I should be on my "tester producer" profile page
  
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
  

