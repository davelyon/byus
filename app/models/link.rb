class Link < ActiveRecord::Base
  TIME_RANGES = %w(24 48 168)
  DEFAULT_TIME_RANGE = "24"
  belongs_to :bin
  belongs_to :domain, counter_cache: true

  validates_presence_of :bin, :location, :title, :domain
  validates_format_of :location , with: URI::regexp,
    message: "should be like http://example.com/"
  validates_uniqueness_of :location, scope: :bin_id

  before_validation :normalize_location, :assign_title, :assign_domain

  scope(:from_hours_ago,
        ->(hours) {where("updated_at >= ?",Link.viewing_range(hours).to_i.hours.ago)})
  scope :nonprivate, joins(:bin).where(bins: {allow_public: true})
  scope :latest, order("#{table_name}.created_at DESC").limit(30)

  def secret_hash
    bin.secret_hash
  end

  def self.normalize_url(url)
    return if url.blank?
    begin
      URI.parse(url).normalize.to_s
    rescue URI::InvalidURIError
      url
    end
  end

  def self.viewing_range(time)
    TIME_RANGES.include?(time) ? time : DEFAULT_TIME_RANGE
  end

  def display_title
    title || location
  end

  private

  def normalize_location
    self.location = Link.normalize_url(location)
  end

  def assign_title
    self.title ||= location
  end

  def assign_domain
    begin
      self.domain = Domain.find_or_create_by_root(URI.parse(self.location).host)
    rescue
    end
  end

end
