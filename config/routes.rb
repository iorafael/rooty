Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :delete]
  resources :routes
  resources :paths
  devise_for :users
  root to: 'pages#home'
end
