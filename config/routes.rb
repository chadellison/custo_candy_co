Rails.application.routes.draw do
  root 'users#index'
  resources :candies, only: [:index]
  resources :categories, only: [:show, :index]
  resources :carts, only: [:create]
  get "/carts", to: "carts#index", as: "/cart"
end
