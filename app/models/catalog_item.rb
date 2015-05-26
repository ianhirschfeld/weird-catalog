class CatalogItem < ActiveRecord::Base

  extend FriendlyId

  friendly_id :name
  attr_accessor :upload_url

  has_attached_file :feature_image,
    styles: {
      large: '1080x608#'
    },
    convert_options: {
      large: '-quality 80 -strip'
    }

  before_validation :set_released_date
  before_save :get_remote_image

  validates_presence_of :creator,
                        :name,
                        :description,
                        :url,
                        :released_date,
                        :released_year
  validates :name, uniqueness: { case_sensitive: false }
  validates_attachment :feature_image, content_type: { content_type: /image/ }

  belongs_to :catalog_category

  scope :published, -> { where(enabled: true) }

  def description_truncated(limit=140)
    if description.length > limit
      # -4 because of ellipses and zero-based index
      description[0..limit-4].strip + '...'
    else
      description
    end
  end

  def released_date_formatted
    if released_day && released_month
      date_string = "#{released_year}-#{released_month}-#{released_day}"
      date_format = '%B %-d, %Y'
    elsif released_month
      date_string = "#{released_year}-#{released_month}-01"
      date_format = '%B, %Y'
    else
      date_string = "#{released_year}-01-01"
      date_format = '%Y'
    end

    date_string.to_date.strftime(date_format)
  end

  def affiliate_url
    if self.url.include? 'amzn.com'
      url + '?tag=weircata-20'
    elsif self.url.include? 'apple.com'
      url + '?at=1l3vwYz'
    else
      url
    end
  end

  private

  def get_remote_image
    if upload_url.present?
      io = open(URI.parse(upload_url))
      self.feature_image = io
    end
  end

  def set_released_date
    date_str = "#{self.released_year}"
    date_str += self.released_month ? "-#{self.released_month}" : '-01'
    date_str += self.released_day ? "-#{self.released_day}" : '-01'
    self.released_date = date_str.to_date
  end

end
