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
  #puts page.body
  with_scope(scope) do
    step step_def
    #puts page.body
  end
end


#When /^I press "([^"]*)" within the "([^"]*)" section$/ do |action, scope|
#  with_scope(selector_for(scope)) do
#    step %Q{I press "#{action}"}
#  end
#end

When /I (un)?check the following roles: (.*)/ do |uncheck, role_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  #puts page.body
  roles = role_list.split(', ')
  #if ratings == []
    # should I check if the rating list is empty?
  if uncheck
    # uncheck all rating_list
    roles.each do |role|
      step %Q{I uncheck "#{role}"}
    end
  elsif not uncheck
    # check all rating_list
    roles.each do |role|
      step %Q{I check "#{role}"}
    end
  end   
end
