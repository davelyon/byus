class Link < ActiveRecord::Base
  belongs_to :bin

  validates :location, presence: true
end
