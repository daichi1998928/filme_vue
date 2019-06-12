class User::MovieReviewsController < ApplicationController
  before_action :authenticate_user!
  def create
    movie = Movie.find(params[:movie_id])
    movie_review = MovieReview.new(movie_review_params)
    movie_review.movie_id = movie.id
    movie_review.user_id = current_user.id

    movie_review.save

    redirect_to user_movie_path(movie)
  end

  private
  def movie_review_params
    params.require(:movie_review).permit(:rate)
  end



end
