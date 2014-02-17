Given(/^a feedback from "(.*?)" with text "(.*?)"$/) do |name, text|
  Feedback.create! name: name, text: text
end

Then(/^I should see (\d+) feedbacks$/) do |count|
  page.should have_css('.feed-container', count: count)
end

And(/^I should see feed text "(.*?)"$/) do |text|
  page.should have_css('.feed-text', text: text)
end

And(/^I should see name "(.*?)"$/) do |name|
  page.should have_css('.feed-name', text: name)
end
