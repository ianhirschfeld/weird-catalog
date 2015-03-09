class AddSlugToCatalogCategories < ActiveRecord::Migration
  def change
    add_column :catalog_categories, :slug, :text
    add_index :catalog_categories, :slug, unique: true
  end
end
