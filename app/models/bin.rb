require 'digest/sha2'
class Bin < ActiveRecord::Base
  has_many :links

  attr_accessible :title

  validates :title, presence: true

  before_validation :check_title, :create_hash

  private

  def check_title
    self.title ||= title
  end

  def create_hash
    self.secret_hash = Digest::SHA2.hexdigest("#{title}--#{Time.now}")
  end

end
