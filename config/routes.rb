Rails.application.routes.draw do
  # get 'movie/index'
  #
  # get 'movie/show'

  root 'movie#index'

  get '/index', to: 'movie#index'
  get '/show', to: 'movie#show'


  get 'auth/logout' => 'auth#logout'
  get 'auth/failure' => 'auth#failure'
  get 'auth/:provider/callback' => 'auth#callback'


end
