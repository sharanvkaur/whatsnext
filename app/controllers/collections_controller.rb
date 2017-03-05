class CollectionsController < ApplicationController
  before_action :current_user

  def index
    @users = User.all
    @collections = Collection.where("user_id = ?", current_user.id)
  end

  def show
    @users = User.all

    @user = User.where("id = ?", params[:id]).first

    @collections = Collection.where("user_id = ?", params[:id])
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.new(collection_params)

    if @collection.save
      redirect_to root_path, notice: "Added to collection"
    else
      redirect_to root_path
    end

  end

  private
  def collection_params
    params.require(:collection).permit(:movie_id, :user_id, :movie_id, :movie_title, :movie_poster, :movie_year, :movie_plot, :movie_runtime, :movie_genre, :movie_metascore, :movie_imdbRating)
  end

end
