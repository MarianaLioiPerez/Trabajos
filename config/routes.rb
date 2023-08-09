Rails.application.routes.draw do
  devise_for :tusers
  devise_scope :tuser do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  resource :tuser, :controller => "tusers"  # Cambio a "resource" en lugar de "resources"
  
  resources :job_offers do
    resources :applications, only: [:create, :destroy]
  end
  
  # Defines the root path route ("/")
  root "home#index"
end
