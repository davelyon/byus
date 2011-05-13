Then /^I should see the link "([^"]*)" (\d+) times?$/ do |url,number|
  page.should have_xpath("//a[@href='#{url}']", count: number.to_i)
end

And /^I use the bookmarklet$/ do
  # self.extend(BinsHelper)
  # script = bookmarklet_for_bin(Bin.last)
  # require 'ruby-debug'; Debugger.start; Debugger.settings[:autoeval] = 1; Debugger.settings[:autolist] = 1; debugger
  # page.execute_script(script)
  visit bookmarklet_path(Bin.last)
end
