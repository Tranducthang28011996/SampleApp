Rails.application.routes.draw do
  # resources :session, only: [:new, :create]
  post 'login' => "session#create"
  post 'signup' => "users#create"
  get 'signout'=> 'session#destroy', as: 'signout'
  resources :users, only: [:index, :new, :create]
  resources :product, only: [:index]
  resources :gridpage, only: [:index]
  resources :orders, only: [:index, :update]
  resources :oderitems, only: [:create, :destroy]
  root 'static_pages#home'
  namespace :admin do 
    resources :categories do
      resources :subcategories, only: [:index, :show]
    end
    resources :products
    root "categories#index"
  end
end
