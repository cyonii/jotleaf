Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#login'
  post 'logout', to: 'sessions#logout'

  resources :users, only: [:new, :create, :show]
  resources :jots, except: [:index] do
    resources :votes, only: [:create, :destroy]
  end
  resources :categories
end
