class Link < ActiveRecord::Base
  belongs_to :bin

  validates :location, presence: true

  after_create :attach_bin

  private

  def attach_bin
    self.bin ||= Bin.create!(title: self.location)
  end
end
