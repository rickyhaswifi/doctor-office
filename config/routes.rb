Rails.application.routes.draw do
  # get 'appointments/index'
  # get 'appointments/new'

  root 'static_pages#index'

  resources :patients  

  resources :physicians do
    resources :appointments
  end

  resources :physicians do
    resources :articles
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
