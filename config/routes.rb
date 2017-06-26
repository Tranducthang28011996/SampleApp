Rails.application.routes.draw do
  get 'reviews' => 'details#list'
  resources :details, only: [:show]
  resources :reviews
  post 'login' => "session#create"
  post 'signup' => "users#create"
  get 'signout'=> 'session#destroy', as: 'signout'
  resources :users, only: [:index, :new, :create]
  resources :product, only: [:index]
  resources :gridpage, only: [:index]
  resources :orders, only: [:index, :update]
  resources :oderitems, only: [:create, :destroy]
  root 'static_pages#home'
  get 'search', to: 'product#search'
  namespace :admin do 
    resources :categories, only: [:index, :show] do
      resources :subcategories, only: [:index, :show]
    end
    resources :products
    root "categories#index"
  end
end
