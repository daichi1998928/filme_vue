class Admin::LpImagesController < ApplicationController

  def edit
    @lp_image = LpImage.find(params[:id])
  end

  def update
  	@lp_image = LpImage.find(params[:id])
  	if @lp_image.update
  	   flash[:notice_m] = "successful update image!!"
       redirect_to edit_admin_lp_image_path(@lp_image)
    else
      render "edit"
    end

  end

  private
  def lp_images_params
    params.require(:lp_image).permit(:image)
  end

end
