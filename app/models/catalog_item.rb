class CatalogItem < ActiveRecord::Base

  validates_presence_of :creator,
                        :name,
                        :description,
                        :url,
                        :released_at

  belongs_to :catalog_category

end
