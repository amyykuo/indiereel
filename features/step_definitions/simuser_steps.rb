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

Then /^the "([^"]*)" dropdown should contain: (.*)$/ do |parent, role_list|
  roles = role_list.split(', ')
  roles.each do |value|
    #field_labeled(field).value.should =~ /#{value}/
    #step %Q{the "#{field}" drop-down should contain the option "#{value}"}
    #step %Q{the "#{value}" field within "#{parent}" should contain "#{value}"}
    step %Q{the "#{parent}" field should contain "#{value}"}
  end
end

Then /^the "([^"]*)" dropdown should not contain: (.*)$/ do |parent, role_list|
  roles = role_list.split(', ')
  roles.each do |value|
    #field_labeled(field).value.should =~ /#{value}/
    #step %Q{the "#{field}" drop-down should contain the option "#{value}"}
    #step %Q{the "#{value}" field within "#{parent}" should contain "#{value}"}
    step %Q{the "#{parent}" field should not contain "#{value}"}
  end
end

#Then /^I should see "([^"]*)"(?: in the "([^"]*)" section)?$/ do |text,section|
#  with_scope(section) do
#    page.should have_content(text)
#  end
#end

When /^(.*) within the "([^"]*)" section$/ do |step, scope|
  with_scope(scope) do
    When step
  end
end

#When /^I press "([^"]*)" within the "([^"]*)" section$/ do |action, scope|
#  with_scope(selector_for(scope)) do
#    step %Q{I press "#{action}"}
#  end
#end

#Then /^the "([^"]*)" drop-down should contain the option "([^"]*)"$/ do |id, value|
#  page.should.have_xpath "//select[@id = '#{id}']/option[text() = '#{value}']"
#end

#Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
#  field_labeled(field).value.should =~ /#{value}/
#end

Then /^I debug$/ do
  debugger
end
