Given /^I am signed in with provider "([^"]*)"$/ do |provider|
  visit "/auth/#{provider}"
end

Given /I have the following roles/ do |roles_table|
  roles_table.hashes.each do |role|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Role.create!(role)
  end
end

Given /I have the following albums/ do |albums_table|
  albums_table.hashes.each do |album|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    MediaCollection.create!(album)
  end
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create_with_omniauth_test_mode(user)
  end
end

Given /I have the following media collections/ do |collections|
  collections.hashes.each do |collection|
    MediaCollection.create!(collection)
  end
end
  

Then /^I debug$/ do
  debugger
end
