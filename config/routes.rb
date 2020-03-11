Rails.application.routes.draw do
  root to: 'pages#intro'
  get '/map' => 'pages#home'
  devise_for :users
  resources :users, only: [:edit, :update, :delete, :show, :index]
  resources :routes
  resources :friends
  resources :nodes
  resources :events, only: [:index, :show, :create, :edit, :destroy ] do
  resources :participants, only: [:create, :destroy]
  end
end
