Rails.application.routes.draw do
  root 'welcome#index'
  resources :candies, only: [:index]
  resources :categories, only: [:show, :index]
end
