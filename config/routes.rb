Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :delete]
    resources :routes, only: [:new, :create, :delete]
  end
  devise_for :users
  root to: 'pages#home'
end
