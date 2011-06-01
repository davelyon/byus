class Domain < ActiveRecord::Base
  has_many :links

  scope :top,  order("links_count DESC").limit(5)
end
