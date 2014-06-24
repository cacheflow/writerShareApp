WriterShareApp::Application.routes.draw do
  
  Mercury::Engine.routes
  root "sessions#new"

  resources :users do
      resources :versions
  end

  resources :sessions, :only => [:new, :create, :destroy]

  resources :user_friendships, :only => [:create, :destroy]

  get "users/search" => "users#search"

end