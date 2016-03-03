Rails.application.routes.draw do
  root 'welcome#index'

  resources :candies, only: [:index, :show]

  resources :categories, only: [:show, :index]

  get "/login", to: "users#new"
  post "/users", to: "users#create"
  get "/dashboard", to: "users#show"

  resources :carts, only: [:create]
  get "/cart", to: "carts#show"
  put "/cart", to: "carts#update"
  delete "/cart", to: "carts#destroy"
end
