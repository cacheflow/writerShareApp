WriterShareApp::Application.routes.draw do
  
resources :version do 
 :comments 
 end 
  resources :activities 

  root "sessions#new"
 
  resources :users do
      resources :versions
  end

  resources :sessions, :only => [:new, :create, :destroy]


  resources :user_friendships, :only => [:create, :destroy]

  get "users/search" => "users#search"

end
