class Bin < ActiveRecord::Base
  has_many :links

  validates :title, presence: true

  after_create :check_name

  private

  def check_name
    self.title ||= links.first.location
  end

end
