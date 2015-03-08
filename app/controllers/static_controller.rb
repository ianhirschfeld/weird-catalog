class StaticController < ApplicationController

  before_action :load_categories

  def home
    @items = CatalogItem.order('created_at DESC')
  end

end
