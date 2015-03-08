class CatalogItemsController < ApplicationController

  before_action :load_categories

  def show
    @item = CatalogItem.eager_load(:catalog_category).friendly.find params[:id]
  end

end
