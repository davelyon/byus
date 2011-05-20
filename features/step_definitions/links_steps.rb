Then /^I should see (\d+) links$/ do |num|
  find("#link_list").all('a').count.should == num.to_i
end
