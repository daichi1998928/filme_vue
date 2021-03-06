class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!
  def index
    @users = User.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
    @history_items=HistoryItem.where(user_id:params[:id]).order(:created_at).page(params[:page]).per(8)
  end

  def new
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
       flash[:notice_m] = "successful Update User!!"
       redirect_to admin_users_path
    else
       @users = User.all
       render "index"
    end
  end

  def destroy
  	@user = User.find(params[:id])
  	if @user.destroy
       flash[:notice_m] = "successful Delete User!!"
       redirect_to admin_users_path
    else
       @users = User.all
       render "index"
    end
  end

  private

    def user_params
      params.require(:user).permit(:image,:name,:phonetic_name)
    end


end
