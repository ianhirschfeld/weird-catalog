class CatalogCategory < ActiveRecord::Base

  extend FriendlyId

  friendly_id :name

  validates_presence_of :name
  validates :name, uniqueness: { case_sensitive: false }

  has_many :catalog_items

end
