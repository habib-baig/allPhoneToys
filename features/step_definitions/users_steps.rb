When /^I sign in as "(.*)" and "(.*)"$/ do |email, password|
  fill_in 'email', :with => "#{email}"
  fill_in 'password', :with => "#{password}"
  click_button 'Log in'
end

Given /^I am signed in$/ do
  visit '/'
  click_link 'Sign Up'
  fill_in 'user_name', :with => 'xyz'
  fill_in 'user_email', :with => 'abc@test.com'
  fill_in 'user_phone', :with => '9876543210'
  fill_in 'user_password', :with => 'qwerty'
  fill_in 'user_prefAmount', :with => '23'
  click_button 'Sign Up'
  if page.respond_to? :should
    page.should have_content('User was successfully created.')
  else
    assert page.has_content?('User was successfully created.')
  end
  fill_in 'email', :with => 'abc@test.com'
  fill_in 'password', :with => 'qwerty'
  click_button 'Log in'
  
end

Given /^I am signed in as an admin$/ do
  fill_in 'email', :with => 'shaik@gmail.com'
  fill_in 'password', :with => 'shaik'
  click_button 'Log in'
end

When /^I sign with invalid email as "(.*)"$/ do |email|
  fill_in 'email', :with => "#{email}"
  click_button 'Log in'
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

And /^I fill in the select field "([^"]*)" with "([^"]*)"$/ do |field, value|
  select value, from: field, visible: false
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When(/^I select the time (\d+)\-(\d+)\-(\d+) (\d+):(\d+) from "(.*?)"$/) do |year, month, day, hour, minute, label_text|
  label = page.find('label', text: label_text)
  id = label['for']
  select year,   from: "#{id}_1i", visible: false
  select month,  from: "#{id}_2i", visible: false
  select day,    from: "#{id}_3i", visible: false
  select hour,   from: "#{id}_4i", visible: false
  select minute, from: "#{id}_5i", visible: false
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

