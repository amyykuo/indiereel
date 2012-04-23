# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^my "([^"]*)" home\s?page$/ # user's home page
      home_path($1)
      
    when /^the "([^"]*)" home\s?page$/ # user's home page
      home_path($1)
      
    when /^the welcome page$/
      '/' # need to change this eventually
      
    when /^the "([^"]*)" Projects page for the "([^"]*)" role$/
      projects_path($1, $2)
      
    when /^the "([^"]*)" Portfolio page for the "([^"]*)" role$/
      portfolio_path($1, $2)
    
    when /my "([^"]*)" Edit Page/
      user = $1.split[0]
      role = $1.split[1]
      custom_edit_role_path(user, role)
      
    when /^the Create Role Page/
      '/roles/new'
      
    when /^my "([^"]*)" profile page/
      user = $1.split[0]
      role = $1.split[1]
      custom_role_path(user, role)
      
    when /^the "([^"]*)" profile page/
      user = $1.split[0]
      role = $1.split[1]
      custom_role_path(user, role)
      
    when /^the preview of my "([^"]*)" profile/
      user = $1.split[0]
      role = $1.split[1]
      custom_role_path(user, role) + '?preview=true'
      
    when /^my "([^"]*)" portfolio page/
      user = $1.split[0]
      role = $1.split[1]
      portfolio_path(user, role)
      
    when /my "([^"]*)" "([^"]*)" media collection page for the "([^"]*)" role/
      custom_mc_path($1, $3, $2)
      
    when /the "([^"]*)" "([^"]*)" media collection "([^"]*)" edit page/
      custom_edit_mc_path($1, $2, $3)
    
    when /my "([^"]*)" media collection create page/
      new_media_collection_path(:role => $1)

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
