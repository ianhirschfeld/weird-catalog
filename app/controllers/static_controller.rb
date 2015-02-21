class StaticController < ApplicationController

  def home
    @categories = CatalogCategory.order('name ASC')
  end

end
