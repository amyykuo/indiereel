Feature: Media Collection Create page

As a User
I want to be able to create media collections
So that I can show my new works

Background:
  Given I am signed in with provider "facebook"
  
  And I have the following roles:
  | role_type  | id | user_id | role_name | profile_pic            | email         | role_type_description | role_experience | role_skills |
  |  director  | 1  | 1       |  John     | http://hi.com/user.png | test@xxxx.com | I am awesome!         | everything      | none        |
  |   talent   | 2  | 1       |  Nguyen   | http://pi.com/user.png | best@xxxx.com | I not awesome         | nothing         | some        |
    
  And I have the following albums:
  | role_id | title | description |
  | 1       | What  | Wait?       |
  | 2       | Who   | Where?      |
  
  And I am on my "talent" media collection create page
  And I should see "Title"
  
Scenario: Successfully create a MC #A user should be able to access portfolio page through any of its media collections
  When I fill in "mc_title" with "photoshoot"
  And I fill in "mc_description" with "this was awesome"
  And I press "Create Album"
  Then I should be on my "tester" "3" media collection page for the "talent" role #need to make this... more general?
  And I should see "photoshoot"
  And I should see "this was awesome"

Scenario: Successfully cancel
  When I fill in "mc_title" with "photoshoot"
  And I follow "Cancel"
  Then I should be on the "tester" Portfolio page for the "talent" role

Scenario: Get redirected when user doesn't fill in title field
  When I fill in "mc_description" with "this is not awesome"
  When I fill in "mc_title" with ""
  And I press "Create Album"
  Then I should see "Title"
  And I should see "Album needs a title"
  And I should be on my "talent" media collection create page #TODO this doesn't pass
  # it's because in web_step line 233, URI.parse(blah.com).path gets rid of parameters
  # so its comparing the wrong things :( this scenario should be passing but cuke is being a butt
