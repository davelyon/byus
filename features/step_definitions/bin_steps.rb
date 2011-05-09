Then /^I should see the bin hash$/ do
  page.has_content? Bin.last.secret_hash
end
