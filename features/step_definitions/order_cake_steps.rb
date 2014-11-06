When(/^I order "(.*?)" cake$/) do |cake_type|
  case cake_type
    when 'Cake House'
       id = '#t-1'
    when 'Home'
      id = '#t-2'
  end

  find(id + ' .order-cake').click
  sleep(1)
end

Then(/^I should see that my email is bad$/) do
  page.should have_css('.message-wrap.visible')
end

#Removed functional
#And(/^I should see input for photo in cake form for cake$/) do
#  page.should have_css("#input-image")
#end