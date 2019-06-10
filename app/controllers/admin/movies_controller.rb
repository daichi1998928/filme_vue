class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.page(params[:page]).per(4)
  end

  def create
    @new_movie = Movie.new(movie_params)

    if @new_movie.save
      flash[:movie] = "successful Created Movie!!"
    else
      render :new
    end
  end


  def new
    @new_movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice_m] = "successful Edit movie"
      redirect_to edit_admin_movie_path(@movie)
    else
      render "edit"
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.delete
       flash[:notice_m] = "successful Delete Movie!!"
       redirect_to admin_movies_path
    else
       @movies = Movie.all
       render "index"
    end
  end

  private
  def movie_params
     params.require(:movie).permit(:image,:url,:detail,:title)
  end

end
