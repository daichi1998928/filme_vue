class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
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
  end

  private

    def user_params
      params.require(:user).permit(:email, :encrypted_password,:reset_password_token,:reset_password_sent_at,:remember_created_at ,name:, :phonetic_name, :postal_code, :prefecture, :city, :adress, :phone_number, :image)
    end

end
