class User::MoviesController < ApplicationController

  def show
    @movie = Movie.find_by(id: params[:id])

    if @movie != nil
      @movie_review = MovieReview.new
      @movie_relation_product = Product.where("product_title LIKE ?", "%#{@movie.title}%").first

      if @movie.movie_reviews.exists?
        @movie_review_average = @movie.movie_reviews.average(:rate).ceil.to_s
        @movie_review_average_file = 'star' + @movie_review_average + '.png'
      end
    else
      redirect_to user_products_path
    end
  end

  def index
    @ranks=[]
    Movie.all.each do |movie|
     unless movie.movie_reviews.average(:rate).to_s.empty?
      val1=movie.movie_reviews.average(:rate).to_s
      val2=movie.id
      @ranks<<[val1, val2]
     end
    end
    @ranks=@ranks.sort { |a, b| a[0] <=> b[0] }.reverse.first(5)
    @movies=Movie.all
  end


private
  def movies_params
    params.require(:movie).permit(:image, :title, :url, :detail)
  end


end
