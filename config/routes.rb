Rails.application.routes.draw do
  root 'users#index'
  resources :candies, only: [:index]
  resources :categories, only: [:show]
end
