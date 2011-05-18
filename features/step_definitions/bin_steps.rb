Then /^I should see the bin hash$/ do
  page.should have_content "Your Secret URL"
end

Then /^I should not see the bin hash$/ do
  page.should_not have_content "Your Secret URL"
end

Then /^I should see the bin public link$/ do
  page.should have_content "Public Link"
end

And /^the bin should have that link$/ do
  Bin.last.links.first.location.should include(bin_path(Bin.last))
end

Then /^I should see "([^"]*)" in link position (\d+)$/ do |link, position|
  node = page.find(".links li:nth-child(#{position}) a:nth-child(1)")
  node[:href].should == link
end
