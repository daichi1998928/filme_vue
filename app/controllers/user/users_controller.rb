class User::UsersController < ApplicationController
    def destroy_check
    end

    def edit
      @user = current_user
    end

    def show
      @user_id = User.find(params[:id])
    end
end
