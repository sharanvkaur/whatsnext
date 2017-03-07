class CollectionsController < ApplicationController
  before_action :current_user
  before_action :prevent_unauthorized_user_access, except: [:index, :show]

  def index
    @users = User.all
    @votes = Vote.all
    @collections = Collection.where("user_id = ?", current_user.id)
  end

  def show
    @users = User.all
    @votes = Vote.all

    @user = User.where("id = ?", params[:id]).first

    @collections = Collection.where("user_id = ?", params[:id]).order('created_at DESC')

    if current_user
      @my_movies = Collection.where("user_id = ?", current_user.id)
    end
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.new(collection_params)

    if @collection.save
      redirect_to collection_path(@collection.user_id), notice: "Added to collection"
    else
      redirect_to root_path
    end
  end

  def destroy
    collection = Collection.find_by(id: params[:id])
      collection.destroy
      redirect_to collection_path(current_user.id), notice: 'Collection successfully deleted'
  end


  def upvote
    collection = Collection.find_by(id: params[:id])
    if current_user.upvoted?(collection)
      current_user.remove_vote(collection)
    elsif current_user.downvoted?(collection)
    current_user.remove_vote(collection)
    current_user.upvote(collection)
    else
      current_user.upvote(collection)
    end

    collection.calc_points
    redirect_to collection_path(collection.user_id), notice: "you kenot"
  end

  def downvote
    collection = Collection.find_by(id: params[:id])
    if current_user.downvoted?(collection)
      current_user.remove_vote(collection)
    elsif current_user.upvoted?(collection)
      current_user.remove_vote(collection)
      current_user.downvote(collection)
    else
      current_user.downvote(collection)
    end

    collection.calc_points
    redirect_to collection_path(collection.user_id)
  end

  private
  def collection_params
    params.require(:collection).permit(:movie_id, :user_id, :movie_id, :movie_title, :movie_poster, :movie_year, :movie_plot, :movie_runtime, :movie_genre, :movie_metascore, :movie_imdbRating)
  end

end
