Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:edit, :update, :delete, :show]
  resources :routes
  resources :nodes
  resources :events, only: [:index, :show, :create, :edit, :destroy ] do
    resources :participants, only: [:create, :destroy]
  end
end
