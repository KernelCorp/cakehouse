Given(/^I sign in as admin$/) do
  visit '/admin'
  AdminUser.create(:email => 'admin@example.com', :password => 'password') unless
      AdminUser.where(:email => 'admin@example.com').first
  within('#session_new') do
    fill_in 'admin_user[email]', :with => 'admin@example.com'
    fill_in 'admin_user[password]', :with => 'password'
  end
  find('#admin_user_submit_action input').click
end

Given(/^a customer with email: "(.*?)", subscription: "(.*?)"$/) do |email, delivery|
  Customer.create! email: email, delivery: delivery
end

When(/^I go to "(.*?)"$/) do |url|
  visit url
end

When(/^I fill up input for name as "(.*?)"$/) do |name|
  within('#new_sale') do
    fill_in 'sale[name]', with: name
  end

end

When(/^I click to submit$/) do
  find('input[name=commit]').click
  sleep(1)
end

#Then(/^email:  "(.*?)" should received new email$/) do |arg1|
#
#end
#
#
#But(/^email:  "(.*?)" shouldn't received new email$/) do |arg1|
#
#end