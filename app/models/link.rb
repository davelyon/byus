class Link < ActiveRecord::Base
  belongs_to :bin

  validates_presence_of :bin, :location

  validates_format_of :location , with: URI::regexp, message: "should be like http://example.com/"

  validates_uniqueness_of :location, scope: :bin_id

  def secret_hash
    bin.secret_hash
  end

end
