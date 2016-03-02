Rails.application.routes.draw do
  root 'welcome#index'
  resources :candies, only: [:index]
  resources :categories, only: [:show, :index]
  resources :carts, only: [:create]
  get "/cart", to: "carts#show"
end
