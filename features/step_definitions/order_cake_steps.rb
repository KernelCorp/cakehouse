When(/^I order "(.*?)" cake$/) do |cake_type|
  case cake_type
    when 'Cake House'
       id = '#t-6'
    when 'Home'
      id = '#t-2'
  end

  find(id + ' .order-cake').click
  sleep(1)
end

Then(/^I should see that my email is bad$/) do
  page.should have_css('.message-wrap.visible')
end

And(/^I should see input for "(.*?)" in "(.*?)" form for cake$/) do |attr, klass|
  page.should have_css("##{klass}_order_"+attr)
end