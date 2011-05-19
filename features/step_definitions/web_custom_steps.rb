Then /^I should see the link "([^"]*)" (\d+) times?$/ do |url,number|
  page.should have_xpath("//a[@href='#{url}']", count: number.to_i)
end

And /^I debug$/ do
  debugger
end
