Fabricator(:link) do
  location { Fabricate.sequence(:location) { |n| "http://reddit.com/r/ruby#{n}" } }
end

Fabricator(:titled_link, from: :link) do
  title "Foo foo the foo bear bear foo"
end
