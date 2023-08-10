Rails.application.routes.draw do
  devise_for :tusers
  devise_scope :tuser do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
 
  #resources :tusers, only: [:new, :create, :show, :index, :edit, :update]
  resources :tusers , :controller => "tusers"
  
  resources :job_offers do
    resources :applications, only: [:create, :destroy]
  end
  
  # Defines the root path route ("/")
  root "home#index"
end
