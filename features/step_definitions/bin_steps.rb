Then /^I should see the bin hash$/ do
  page.has_link? "Your Secret URL", href: Bin.last.secret_hash
end

And /^the bin should have that link$/ do
  Bin.last.links.first.location.should include(bin_path(Bin.last))
end
