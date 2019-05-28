class User::MoviesController < ApplicationController

  def show

    @movie = Movie.find(params[:id])
    @movie_review = MovieReview.new
    @movie_relation_product = Product.where("product_title LIKE ?", "%#{@movie.title}%").first

    if @movie.movie_reviews.exists?
      @movie_review_average = @movie.movie_reviews.average(:rate).ceil.to_s
      @movie_review_average_file = 'star' + @movie_review_average + '.png'
    end


  end
  def edit
  	@movie = Movie.find(params[:id])
  end

private
  def movies_params
    params.require(:movie).permit(:image, :title, :url, :detail)
  end


end
