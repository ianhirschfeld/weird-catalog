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

  before_save :get_remote_image

  validates_presence_of :creator,
                        :name,
                        :description,
                        :url,
                        :released_at
  validates :name, uniqueness: { case_sensitive: false }
  validates_attachment :feature_image, content_type: { content_type: /image/ }

  belongs_to :catalog_category

  def description_truncated(limit=140)
    if description.length > limit
      # -4 because of ellipses and zero-based index
      description[0..limit-4].strip + '...'
    else
      description
    end
  end

  private

  def get_remote_image
    if upload_url.present?
      io = open(URI.parse(upload_url))
      self.feature_image = io
    end
  end

end
