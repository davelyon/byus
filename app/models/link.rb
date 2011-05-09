class Link < ActiveRecord::Base
  belongs_to :bin

  validates :location, presence: true

  after_initialize :attach_bin

  private

  def attach_bin
    if bin.nil?
      create_bin(title: self.location)
      bin.links << self
    end
  end

end
