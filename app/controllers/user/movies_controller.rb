class User::MoviesController < ApplicationController

  def edit
  	@movie = Movie.find(params[:id])
  end

private
  def movies_params
    params.require(:movie).permit(:image, :title, :url, :detail)
  end

end
