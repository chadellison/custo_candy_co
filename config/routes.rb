Rails.application.routes.draw do
  root 'welcome#index'
  resources :candies, only: [:index, :show]
  resources :categories, only: [:show, :index]
  resources :carts, only: [:create]

  delete "/cart", to: "carts#destroy"
  get "/cart", to: "carts#show"
end
