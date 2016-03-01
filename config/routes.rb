Rails.application.routes.draw do
  root 'users#index'
  resources :candies, only: [:index]
end
