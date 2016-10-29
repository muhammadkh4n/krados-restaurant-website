class SessionsController < BaseController
  skip_before_action :ensure_login, only: [:new, :create]

  def new
  end

  def create
    @admin = Admin.find_by(username: params[:admin][:username])
    password = params[:admin][:password]

    if @admin && @admin.authenticate(password)
      session[:admin_id] = @admin.id
      redirect_to admin_panel_path, notice: "Logged in successfully"
    else
      redirect_to login_path, alert: "Invalid username/password"
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "You have been logged out"
  end
end
