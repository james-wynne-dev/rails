Rails.application.routes.draw do
  root :to => 'posts#index'
  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new'
  post 'posts' => 'posts#create'
  get '/posts/:id' => 'posts#show', as: :user

  get '/tags' => 'tags#index', as: :tags

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy', as: :logout
end
