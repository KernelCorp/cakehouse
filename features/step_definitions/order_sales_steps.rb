#encoding: utf-8
Given(/^I am on "(.*?)"$/) do |url|
  visit url
end

And(/^A sale with name "(.*?)" and description "(.*?)"$/) do |name, description|
  Sale.create! name: name, description: description
end

When(/^I order sales$/) do
  visit '#events-right'
end

Then(/^I should see form for order "(.*?)"$/) do |klass|
  page.should have_css("#new_#{klass}_order")
end

And(/^I should see input for "(.*?)" in "(.*?)" form$/) do |attr, klass|
  page.should have_css("##{klass}_order_customer_"+attr)
end

And(/^I should see check box for "(.*?)" in "(.*?)" form$/) do |attr, klass|
  page.should have_css("input[name='#{klass}_order[customer][#{attr}]']")
end

And(/^I fill up input "(.*?)" as "(.*?)" in "(.*?)" form$/) do |attr, value, klass|
  fill_in "#{klass}_order[customer][#{attr}]", with: value
end

And(/^I click to "(.*?)" in "(.*?)" form$/) do |attr, klass|
  find("#new_#{klass}_order input[type='#{attr}']").click
  sleep(1)
end

Then(/^I should see success$/) do
  page.should have_css('#order-success')
  #page.should have_css('#order-success')#, text: 'Ваш заказ принят! В ближайшее время мы свяжемся с вами.')
end