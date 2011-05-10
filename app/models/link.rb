class Link < ActiveRecord::Base
  belongs_to :bin

  validates :location, presence: true

  before_validation :attach_bin

  def secret_hash
    bin.secret_hash
  end

  private

  def attach_bin
    if self.bin.nil?
      create_bin(title: self.location)
      self.bin.links << self
    end
  end

end
