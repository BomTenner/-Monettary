Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :addresses, only: [:index,:show] do
    resources :transactions, only: [:new, :create]
  end

  resources :transactions, only: [:index]

  get "/transactions/exchange", to: "transactions#exchange", as: :exchange

  resources :assets, only: [:index, :show] do
    resources :addresses, only: [:new, :create]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
