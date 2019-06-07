class Admin::LpImagesController < ApplicationController

  def edit
    if LpImage.all.empty?
     @lp_image = LpImage.create
    else
     @lp_image = LpImage.find(params[:id])
    end
  end

  def update
  	@lp_image = LpImage.find(params[:id])
  	if @lp_image.update(lp_images_params)
  	   flash[:notice_m] = "successful update image!!"
       redirect_to edit_admin_lp_image_path(@lp_image.id)
    else
      render "edit"
    end

  end

  private
  def lp_images_params
    params.require(:lp_image).permit(:image)
  end

end
