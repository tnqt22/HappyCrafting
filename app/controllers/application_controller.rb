class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def authorize
    redirect_to login_path, alert: "Not authorized" if current_user.nil?
  end
  
  def correct_user
    @user = Tutorial.find(params[:id]).user_id
    flash[:notice] = "edit your own stuff man!"
    redirect_to(root_url) unless @user == current_user
  end
end
