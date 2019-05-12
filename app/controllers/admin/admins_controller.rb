class Admin::AdminsController < ApplicationController

  def index
    @admins = Admin.all
  end


  def destroy

  end
end
