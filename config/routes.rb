Rails.application.routes.draw do
  root 'welcome#index'

  resources :candies, only: [:index, :show]

  resources :categories, only: [:show, :index]

  resources :ratings, only: [:new, :create]

  namespace :admin do
    resources :dashboard, only: [:show]
    resources :candies, only: [:index, :show, :new, :create, :edit, :update]
  end

  get "/register", to: "users#new"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post "/users", to: "users#create"
  get "/dashboard", to: "users#show"

  resources :carts, only: [:create]
  get "/cart", to: "carts#show"
  put "/cart", to: "carts#update"
  delete "/cart", to: "carts#destroy"

  resources :orders, only: [:index, :show, :create]
  get "/order_success", to: "order_success#show"

  resources :custom_candies, only: [:new, :create, :show, :index]
end
