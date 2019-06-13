class Admin::LpImagesController < ApplicationController
  before_action :authenticate_admin!
  def edit
    if LpImage.all.empty?
     @lp_image = LpImage.create
    else
     @lp_image = LpImage.find(params[:id])
    end
  end

  def update
  	@lp_image = LpImage.find(params[:id])
  	if @lp_image.update(images_params)
  	   flash[:notice_m] = "successful update image!!"
       redirect_to admin_products_path
    else
      render "edit"
    end

  end

  private
  def images_params
    params.require(:lp_image).permit(:image)
  end

end
