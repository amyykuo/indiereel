Then /^the "([^"]*)" dropdown should contain: (.*)$/ do |parent, role_list|
  roles = role_list.split(', ')
  roles.each do |value|
    step %Q{the "#{parent}" field should contain "#{value}"}
  end
end

Then /^the "([^"]*)" dropdown should not contain: (.*)$/ do |parent, role_list|
  roles = role_list.split(', ')
  roles.each do |value|
    step %Q{the "#{parent}" field should not contain "#{value}"}
  end
end

#Then /^I should see "([^"]*)"(?: in the "([^"]*)" section)?$/ do |text,section|
#  with_scope(section) do
#    page.should have_content(text)
#  end
#end

When /^(.*) within the "([^"]*)" section$/ do |step_def, scope|
  with_scope(scope) do
    step step_def
  end
end


#When /^I press "([^"]*)" within the "([^"]*)" section$/ do |action, scope|
#  with_scope(selector_for(scope)) do
#    step %Q{I press "#{action}"}
#  end
#end
