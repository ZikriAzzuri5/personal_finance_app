Rails.application.routes.draw do

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'register', to: 'registrations#new'
  post 'register', to: 'registrations#create'

  resources :users, only: [:new, :create, :index, :show]

  resources :wallets
  resources :categories
  resources :transactions

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
end
