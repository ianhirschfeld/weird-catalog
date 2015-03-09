class ErrorsController < ApplicationController

  before_action :load_categories
  before_action :set_is_error_page

  def not_found
    render status: :not_found
  end

  def unprocessable_entity
    render :not_found, status: :unprocessable_entity
  end

  def internal_server_error
    render :not_found, status: :internal_server_error
  end

  protected

  def set_is_error_page
    @is_error_page = true
  end

end
