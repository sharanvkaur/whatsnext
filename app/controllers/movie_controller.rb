class MovieController < ApplicationController
  def index
    search = params[:q]
		if search
			resp = Typhoeus.get("http://www.omdbapi.com", params: {s: search})
			@movies = JSON.parse(resp.body)["Search"]
      p resp.body
    else
			@movies = []
		end
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
  end
end
