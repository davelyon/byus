Then /^I should see the bin hash$/ do
  page.has_link? "Your Secret URL", href: Bin.last.secret_hash
end
