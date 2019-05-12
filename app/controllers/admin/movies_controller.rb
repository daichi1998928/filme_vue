class Admin::MoviesController < ApplicationController
  def index
  end

  def create
    @new_movie = Movie.new(moview_params)

    if @new_movie.save
      flash[:movie] = "successful Created Movie!!"
    else
      render :new

    end
  end

  def show
  end

  def new
    @new_movie = Movie.new
  end

  def update
  end

  def destroy
  end

  private
  def moview_params
     params.require(:movie).permit(:image,:url,:detail,:title)
  end

end
