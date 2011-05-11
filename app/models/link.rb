class Link < ActiveRecord::Base
  belongs_to :bin

  validates_presence_of :bin, :location

  validates_format_of :location , with: URI::regexp

  before_validation :attach_bin

  def secret_hash
    bin.secret_hash
  end

  private

  def attach_bin
    self.bin = create_bin(title: location) unless bin.present?
  end
end
