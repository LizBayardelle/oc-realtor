class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_only
    unless current_user && current_user.admin
      redirect_back fallback_location: root_path
      flash[:notice] = "Sorry, you need to be an administrator to do that!"
    end
  end
end
