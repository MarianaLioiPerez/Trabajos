Rails.application.routes.draw do
  
  devise_for :tusers, controllers: {
    sessions: 'tusers/sessions'
  }

  resources :job_offers do
    resources :applications, only: [:create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 root "job_offers#index"
end
