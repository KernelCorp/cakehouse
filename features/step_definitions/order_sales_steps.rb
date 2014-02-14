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

Then(/^I should see form for order$/) do
  page.should have_css('#new_sale_order')
end

And(/^I should see input for "(.*?)"$/) do |attr|
  page.should have_css('#sale_order_customer_'+attr)
end

And(/^I should see check box for "(.*?)"$/) do |attr|
  page.should have_css("input[name='sale_order[customer][#{attr}]']")
end

And(/^I fill up input "(.*?)" as "(.*?)"$/) do |attr, value|
  fill_in "sale_order[customer][#{attr}]", with: value
end

And(/^I click to "(.*?)"$/) do |attr|
  find("#new_sale_order input[type='#{attr}']").click
  sleep(1)
end

Then(/^I should see success$/) do
  page.should have_css('#order-success')
  #page.should have_css('#order-success')#, text: 'Ваш заказ принят! В ближайшее время мы свяжемся с вами.')
end