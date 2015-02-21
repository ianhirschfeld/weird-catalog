class CreateCatalogItems < ActiveRecord::Migration
  def change
    create_table :catalog_items do |t|
      t.text :name
      t.text :description
      t.text :creator
      t.text :url
      t.datetime :released_at
      t.integer :catalog_category_id

      t.timestamps null: false
    end

    add_index :catalog_items, :catalog_category_id
  end
end
