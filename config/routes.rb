WriterShareApp::Application.routes.draw do
  
  # put "users/:user_id/versions/:id/edit" => "versions#mercury_update"

  # mount Mercury::Engine => '/'
  # Mercury::Engine.routes do

  # end


  root "sessions#new"

  resources :users do
      resources :versions do
        member { post :mercury_update }
      end
  end

  resources :sessions, :only => [:new, :create, :destroy]

  resources :user_friendships, :only => [:create, :destroy]

  get "users/search" => "users#search"

  # post "users/:id/versions/new" => "versions#index"



end