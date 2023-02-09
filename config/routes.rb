Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  # get '/portfolios/:portfolio_id/coins/search', to: 'coins#search', as: :search
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :portfolios do
    resources :coins, only: %i[new create]
  end
  resources :portfolios, only: %i[new create index]

  resources :coins, only: %i[new create index show]

end
