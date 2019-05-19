class Admin::AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end


  def destroy
  	@admin = Admin.find(params[:id])
  	if @admin.destroy
      flash[:notice] = "管理者削除に成功しました"
      redirect_to admin_users
    else
      @admins = Admin.all
      render "index"

  end

# ※permitに何入れたらいいんでしょう。。。
# private
#   def admin_params
#     params.require(:admin).permit(:email :name)
#   end

end
