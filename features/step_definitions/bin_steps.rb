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

And /^that bin has (\d+) links$/ do |count|
  count.to_i.times do
    Bin.last.links.create!(Fabricate.attributes_for(:link))
  end
end

Then /^I should see "([^"]*)" in link position (\d+)$/ do |link, position|
  node = page.find("#link_list li:nth-child(#{position}) a:nth-child(1)")
  node[:href].should == link
end
