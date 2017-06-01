Rails.application.routes.draw do
  # resources :session, only: [:new, :create]
  post 'login' => "session#create"
  post 'signup' => "users#create"
  get 'signout', to: 'session#destroy', as: 'signout'
  resources :users, only: [:index, :new, :create]
  root 'static_pages#home'
  namespace :admin do 
    resources :categories do
      resources :subcategories
    end
    resources :products
    root "categories#index"
  end
end
