class User::MoviesController < ApplicationController
<<<<<<< HEAD
=======

  def edit
  	@movie = Movie.find(params[:id])
  end

private
  def movies_params
    params.require(:movie).permit(:image, :title, :url, :detail)
  end


>>>>>>> 22960e94a0754978bac051d3ccf02674a4101311
end
