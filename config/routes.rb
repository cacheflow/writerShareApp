WriterShareApp::Application.routes.draw do
  resources :activities 

  resources :users do
      resources :versions
  end

  resources :sessions

  resources :user_friendships, :only => [:create, :destroy]

  get "users/search" => "users#search"

end