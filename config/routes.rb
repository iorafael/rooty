Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :delete]
  devise_for :users
  root to: 'pages#home'
end
