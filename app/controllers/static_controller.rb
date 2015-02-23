class StaticController < ApplicationController

  def home
    @categories = CatalogCategory.order('name ASC')
    @items = CatalogItem.order('created_at DESC')
  end

end
