Given(/^a text page with name: "(.*?)"$/) do |name|
  Page.create! title: name
end

Then(/^I should see footer$/) do
  page.should have_css('#footer-block')
end

Then(/^I should see link "(.*?)" with href: "(.*?)"$/) do |link, href|
  page.should have_xpath("//a[@href='#{href}']", text: link)
end

Given(/^a text page with body: "(.*?)", name: "(.*?)"$/) do |body, name|
  Page.create! title: name, body: body
end

When(/^I click to page "(.*?)"$/) do |name|
  find('a', text: name).click
  sleep(1)
end

Then(/^I should see h1 "(.*?)"$/) do |name|
  page.should have_css('h1', text: name)
end

Then(/^I should see page body "(.*?)"$/) do |text|
  page.should have_css('.page-text', text: text)
end