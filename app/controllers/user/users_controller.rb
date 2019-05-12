class User::UsersController < ApplicationController
    def destroy_check
    end

    def edit
      @user = current_user
    end
end
