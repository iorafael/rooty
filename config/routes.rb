Rails.application.routes.draw do
  get 'participants/create_or_destroy'
  resources :users, only: [:new, :create, :edit, :update, :delete]
  devise_for :users
  root to: 'pages#home'
end
