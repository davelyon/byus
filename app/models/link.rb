class Link < ActiveRecord::Base
  belongs_to :bin

  validates_presence_of :bin, :location

  validates_format_of :location , with: URI::regexp, message: "should be like http://example.com/"

  validates_uniqueness_of :location, scope: :bin_id

  before_validation :normalize_location

  def secret_hash
    bin.secret_hash
  end

  def self.normalize_url(url)
    begin
      URI.parse(url).normalize.to_s
    rescue URI::InvalidURIError
      url
    end
  end

  private

  def normalize_location
    location = Link.normalize_url(location)
  end

end
