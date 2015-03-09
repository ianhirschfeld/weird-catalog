class StaticController < ApplicationController

  before_action :load_categories

  def home
    @current_sort = if params['sortby'].present?
      params['sortby']
    else
      ''
    end

    @current_category = if params['category'].present?
      CatalogCategory.where(slug: params['category']).first
    end

    order = case @current_sort
    when 'created_at'
      @current_sort_name = 'Date Added'
      'catalog_items.created_at DESC'
    when 'released_at'
      @current_sort_name = 'Release Date'
      'catalog_items.released_at DESC'
    when 'alphabetical'
      @current_sort_name = 'Alphabetical'
      'lower(catalog_items.name) ASC'
    else
      @current_sort_name = 'Date Added'
      'catalog_items.created_at DESC'
    end

    where = if @current_category
      "catalog_categories.slug = '#{@current_category.slug}'"
    else
      ''
    end

    @items = CatalogItem.eager_load(:catalog_category).where(where).order(order)
  end

end
