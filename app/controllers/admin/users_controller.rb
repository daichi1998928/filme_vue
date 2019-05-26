class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def new
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update
       flash[:notice_m] = "successful Update User!!"
       redirect_to edit_admin_user_path(@user)
    else
       @users = User.all
       render "index"
  end

  def destroy
  	@user = User.find(params[:id])
  	if @user.destroy
       flash[:notice_m] = "successful Delete User!!"
       redirect_to edit_admin_user_path(@user)
    else
       @users = User.all
       render "index"
  end

  private
    def products_params
      params.require(:user).permit(:email, :encrypted_password,:reset_password_token,:reset_password_sent_at,:remember_created_at ,name:, :phonetic_name, :postal_code, :prefecture, :city, :adress, :phone_number, :image)
    end
  end

end
