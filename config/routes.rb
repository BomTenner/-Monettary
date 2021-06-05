Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/confirmation/:transaction_id', to: 'pages#confirmation', as: "trans_confirmation"

  resources :addresses, only: [:index,:show]

  resources :exchanges, only: [:index, :new, :create]


  resources :transactions, only: [:index, :show]



  resources :assets, only: [:index, :show] do
    resources :addresses, only: [:new, :create]
    resources :transactions, only: [:new, :create]
  end

  resources :contacts, only: [:index, :create]

  resources :staking, only: [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
