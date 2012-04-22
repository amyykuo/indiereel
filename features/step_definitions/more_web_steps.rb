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

Then /^(?:|I )should be in preview mode on "([^"]*)"$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    (current_path + '?preview=true').should == path_to("the preview of my #{page_name} profile")
  else
    assert_equal path_to(page_name), (current_path + '?preview=true')
  end
end


#When /^I press "([^"]*)" within the "([^"]*)" section$/ do |action, scope|
#  with_scope(selector_for(scope)) do
#    step %Q{I press "#{action}"}
#  end
#end
