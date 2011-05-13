And /^"([^"]*)" is (\d+) hours old$/ do |link,amt|
 Bin.last.links.create!(location: link, created_at: amt.to_i.hours.ago)
end
