class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_login
  helper_method :logged_in?, :current_admin

  protected
    def ensure_login
      redirect_to login_path unless session[:admin_id]
    end

    def logged_in?
      session[:admin_id]
    end

    def current_admin
      @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
    end
end
