class AddSlugToCatalogItems < ActiveRecord::Migration
  def change
    add_column :catalog_items, :slug, :text
    add_index :catalog_items, :slug, unique: true
  end
end
