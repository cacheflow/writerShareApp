WriterShareApp::Application.routes.draw do
  
  resources :users do
    resources :pieces do
      resources :versions
    end
  end

  resources :sessions

end