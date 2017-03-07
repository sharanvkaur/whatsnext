class MoviesController < ApplicationController
  def index
    search = params[:q]
		if search
			resp = Typhoeus.get("http://www.omdbapi.com", params: {s: search})
			@movies = JSON.parse(resp.body)["Search"]
      p resp.body
    else
			@movies = []
		end
    @collections = Collection.select(:movie_poster, :movie_id, :movie_title).distinct.order("movie_title ASC")
    @users = User.all
  end

  def show
    imdbID = params[:q]
		if imdbID
			resp = Typhoeus.get("http://www.omdbapi.com", params: {i: imdbID})
			@movie = JSON.parse(resp.body)
      p resp.body
		else
			@movie = {}
		end

    if current_user
      @user_has_movie = Collection.where(movie_id: (params[:q]), user_id: current_user.id).first
    end
  end
end
