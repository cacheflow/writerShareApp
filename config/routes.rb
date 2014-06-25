WriterShareApp::Application.routes.draw do
  
resources :version do 
 :comments 
 end 
  resources :activities 
  
  mount Mercury::Engine => '/'
  Mercury::Engine.routes do

  end


  root "sessions#index"

 
  resources :users do
      resources :versions
  end

  resources :sessions, :only => [:new, :index, :create, :destroy]


  resources :user_friendships, :only => [:create, :destroy]

  get "users/search" => "users#search"

end
