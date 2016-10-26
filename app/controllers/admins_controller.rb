class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :verify_admin, only: [:edit, :update]
  before_action :no_destroy_self, only: [:destroy]
  before_action :last_admin, only: [:destroy]

  # GET /admin
  # GET /admin.json
  def index
    @admins = Admin.all
  end

  # GET /admin/1
  # GET /admin/1.json
  def show
  end

  # GET /admin/new
  def new
    @admin = Admin.new
  end

  # GET /admin/1/edit
  def edit
  end

  # POST /admin
  # POST /admin.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_url, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/1
  # PATCH/PUT /admin/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admins_url, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/1
  # DELETE /admin/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:username, :password, :password_confirmation)
    end

    # check if editor is editing own account
    def verify_admin
      redirect_to(admins_url, alert: "Not Authorized!") unless Admin.find(params[:id]) == current_admin
    end

    # last admin not destroyable
    def last_admin
      redirect_to(admins_url, alert: "Can't destroy all admins!") unless Admin.all.count > 1
    end

    # can't destroy self
    def no_destroy_self
      redirect_to(admins_url, alert: "Not Possible! You are logged in currently!") if Admin.find(params[:id]) == current_admin
    end
end
