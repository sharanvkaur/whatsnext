Rails.application.routes.draw do
  # get 'movie/index'
  #
  # get 'movie/show'

  root 'collections#index'

  resources :collections

  get '/index', to: 'movies#index'
  get '/show', to: 'movies#show'


  get 'auth/logout' => 'auth#logout'
  get 'auth/failure' => 'auth#failure'
  get 'auth/:provider/callback' => 'auth#callback'


end
