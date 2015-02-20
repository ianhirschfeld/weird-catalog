class AdminController < ApplicationController

  before_action :require_login
  before_action :require_admin

  def show
  end

  private

  def require_admin
    if signed_out? || !current_user.admin?
      redirect_to root_path
    end
  end

end
