Rails.application.routes.draw do
  resources :session, only: [:new, :create]
  get 'signout', to: 'session#destroy', as: 'signout'
  resources :users, only: [:index, :new, :create]

  root 'static_pages#home'

  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "application/hello"
  get 'static_pages/index'
end
