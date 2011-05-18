require 'digest/sha1'
class Bin < ActiveRecord::Base
  has_many :links, order: 'links.updated_at DESC', inverse_of: :bin

  attr_accessible :title, :links_attributes
  accepts_nested_attributes_for :links

  validates_presence_of :secret_hash, :public_hash, :title

  before_validation :generate_hash, unless: :secret_hash
  before_validation :generate_title

  def to_param
    secret_hash
  end

  private

  def generate_hash
    hash = Digest::SHA1.hexdigest("#{title}--#{Time.now}")
    self.secret_hash ||= id.to_i.to_s(16) + hash.slice(4..12)
    self.public_hash ||= hash.slice(12..18) + id.to_i.to_s(18)
  end

  def generate_title
    self.title ||= links.first.try(:location)
  end
end
