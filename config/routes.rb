Rails.application.routes.draw do
  get 'participants/create_or_destroy'
  resources :users, only: [:new, :create, :edit, :update, :delete]
  resources :routes
  resources :paths
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events, only: [:index, :show, :new, :create, :edit, :destroy ]

end
