Rails.application.routes.draw do
  root 'welcome#index'

  resources :candies, only: [:index]

  resources :categories, only: [:show, :index]

  resources :carts, only: [:create]
  get "/cart", to: "carts#index"

  get "/login", to: "users#new"
  post "/users", to: "users#create"
  get "/dashboard", to: "users#show"
end
