Then /^I should see the bin hash$/ do
  page.has_link? "Your Secret URL", href: Bin.last.secret_hash
end

And /^the bin should have that link$/ do
  Bin.last.links.first.location.should include(bin_path(Bin.last))
end

Then /^I should see "([^"]*)" in link position (\d+)$/ do |link, position|
  node = page.find(".links a:nth-child(#{position})")
  node[:href].should == link
end
