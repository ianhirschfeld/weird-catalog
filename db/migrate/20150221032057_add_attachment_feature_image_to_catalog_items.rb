class AddAttachmentFeatureImageToCatalogItems < ActiveRecord::Migration
  def self.up
    change_table :catalog_items do |t|
      t.attachment :feature_image
    end
  end

  def self.down
    remove_attachment :catalog_items, :feature_image
  end
end
