Rails.application.routes.draw do
  get 'coins/index'
  get 'coins/show'
  get 'coins/new'
  devise_for :users
  # root to: 'pages#home'
  root to: 'coins#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :portfolios, only: %i[index show] do
    resources :coins, only: %i[index show]
  end
end
