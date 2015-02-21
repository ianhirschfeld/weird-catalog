class CreateCatalogCategories < ActiveRecord::Migration
  def change
    create_table :catalog_categories do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
