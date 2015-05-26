class AddColumnsToCatalogItems < ActiveRecord::Migration
  def change
    add_column :catalog_items, :enabled, :boolean, default: true
    add_column :catalog_items, :send_to_buffer, :boolean, default: false

    add_index :catalog_items, :enabled
    add_index :catalog_items, :send_to_buffer
  end
end
