Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:edit, :update, :delete, :show]
  resources :routes
  resources :paths
  resources :events, only: [:index, :show, :new, :create, :edit, :destroy ]
end
