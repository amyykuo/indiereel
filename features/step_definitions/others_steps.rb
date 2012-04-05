Given /^I am signed in with provider "([^"]*)"$/ do |provider|
  visit "/auth/#{provider}"
end

Then /^I debug$/ do
  debugger
end
