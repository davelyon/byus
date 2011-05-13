require 'digest/sha1'
class Bin < ActiveRecord::Base
  has_many :links, order: 'created_at DESC'

  attr_accessible :title

  validates_presence_of :secret_hash, :title

  before_validation :generate_hash, unless: :secret_hash

  def to_param
    secret_hash
  end

  private

  def generate_hash
    self.secret_hash = Digest::SHA1.hexdigest("#{title}--#{Time.now}")
  end
end
