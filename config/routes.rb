WriterShareApp::Application.routes.draw do
  
  get "comments/create"
  get "comments/index"
  root "sessions#new"

  resources :users do
      resources :versions
  end

  resources :sessions

end