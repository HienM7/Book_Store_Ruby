class ApplicationController < ActionController::Base
  
  private
  def ensure_admin_user!
    redirect_to root_path unless current_user && current_user.admin?
  end
end
