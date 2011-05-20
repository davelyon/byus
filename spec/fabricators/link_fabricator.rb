Fabricator(:link) do
  location { Fabricate.sequence(:location) { |n| "http://reddit.com/r/ruby#{n}" } }
end
