class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def update
  end

  def destroy
  end
end
