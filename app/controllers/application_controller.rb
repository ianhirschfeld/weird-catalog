class ApplicationController < ActionController::Base

  include Clearance::Controller

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def load_categories
    @categories = CatalogCategory.order('name ASC')
  end

end
