class User::MoviesController < ApplicationController
   def edit
   	@movie = Movie.find (params[:id])
   end

end
