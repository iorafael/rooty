Rails.application.routes.draw do
  root to: 'pages#intro'
  get '/map' => 'pages#home'
  get '/profile', to: "pages#profile"
  devise_for :users
  resources :users, only: [:edit, :update, :delete, :show, :index] do
    resources :friends, only: [:create, :destroy]
  end
  resources :friends, only: [:update]
  resources :routes
  resources :nodes
  resources :events, only: [:index, :show, :create, :edit, :destroy ] do
  resources :participants, only: [:create, :destroy]
  end
end
