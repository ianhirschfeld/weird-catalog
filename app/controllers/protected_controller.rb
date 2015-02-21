class ProtectedController < ApplicationController

  before_action :require_login
  before_action :require_admin

  layout 'admin'

  protected

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

end
