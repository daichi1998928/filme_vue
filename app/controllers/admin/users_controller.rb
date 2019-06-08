class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
    @history_items=HistoryItem.where(user_id:@user.id).order(:created_at)
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
      params.require(:user).permit(:image,:name,:phonetic_name)
    end

    def product_status_params
      params.require(:user).permit(:image,:name,:phonetic_name)
    end

end
