WriterShareApp::Application.routes.draw do
  
resources :version do 
 :comments 
 end 

  root "sessions#new"
 
  resources :users do
      resources :versions
  end

  resources :sessions

end
