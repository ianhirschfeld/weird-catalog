class UpdateReleaseColumns < ActiveRecord::Migration
  def up
    rename_column :catalog_items, :released_at, :released_date
    change_column :catalog_items, :released_date, :date
    add_column :catalog_items, :released_year, :integer
    add_column :catalog_items, :released_month, :integer
    add_column :catalog_items, :released_day, :integer
  end

  def down
    rename_column :catalog_items, :released_date, :released_at
    change_column :catalog_items, :released_at, :datetime
    remove_column :catalog_items, :released_year
    remove_column :catalog_items, :released_month
    remove_column :catalog_items, :released_day
  end
end
