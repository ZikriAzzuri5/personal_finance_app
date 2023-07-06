Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'register', to: 'registrations#new'
  post 'register', to: 'registrations#create'

  get 'chart', to: 'transactions#chart', as: 'transactions_chart'

  resources :users, only: [:new, :create, :index, :show]
  resources :wallets
  resources :categories
  resources :transactions
  resources :transaction_templates
  resources :passwords, only: %i[edit update], param: :token

  resource :reset_password, only: %i[new create]


  root "dashboard#index"
end
