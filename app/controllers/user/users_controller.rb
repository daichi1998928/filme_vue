class User::UsersController < ApplicationController

    def destroy_check
    end

    def edit
      @user = current_user
    end

    def update
      @user = current_user
      if @user.update
         flash[:notice] = "編集に成功しました"
    　　  redirect_to user_path(@user)
      else
         render "edit"
      end
    end

    def show
      @user_id = User.find(params[:id])
    end

    def finish
    end

    private

	def users_params
	   params.require(:users).permit(:email :reset_password_token :reset_password_sent_at :remember_created_at :name :phonetic_name :postal_code :prefecture :city :adress :phone_number :image :)
	end

end
