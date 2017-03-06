Rails.application.routes.draw do
  # get 'movie/index'
  #
  # get 'movie/show'

  root 'movies#index'

  resources :collections do
    post :upvote, on: :member
    post :downvote, on: :member
  end

  # resources :users do
  #   resources :collections do
  #     post :upvote, on: :member
  #     post :downvote, on: :member
  #   end
  # end


  get '/index', to: 'movies#index'
  get '/show', to: 'movies#show'


  get 'auth/logout' => 'auth#logout'
  get 'auth/failure' => 'auth#failure'
  get 'auth/:provider/callback' => 'auth#callback'


end
