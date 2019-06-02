class Admin::AdminsController < ApplicationController
  def index
    @admins = Admin.page(params[:page]).per(4)
  end


  def destroy
  	@admin = Admin.find(params[:id])
  	if @admin.destroy
      flash[:notice_m] = "successful Delete AdminUser!!"
      redirect_to admin_users
    else
      @admins = Admin.all
      render "index"
    end
  end

  private
    def admin_params
      params.require(:admin).permit(:email, :name, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at)
    end
end
