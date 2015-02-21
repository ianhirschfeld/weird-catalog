class CatalogCategory < ActiveRecord::Base

  validates_presence_of :name

  has_many :catalog_items

end
