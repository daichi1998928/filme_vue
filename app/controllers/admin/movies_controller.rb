class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def create
    @new_movie = Movie.new(movie_params)

    if @new_movie.save
      flash[:movie] = "successful Created Movie!!"
    else
      render :new

    end
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_relation_product = Product.where("product_title LIKE ?", "%#{@movie.title}%").first
    binding.pry

  end

  def new
    @new_movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update
    redirect_to admin_movies_path
  end

  def destroy
  end

  private
  def movie_params
     params.require(:movie).permit(:image,:url,:detail,:title)
  end

end
