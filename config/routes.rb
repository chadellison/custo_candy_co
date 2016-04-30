Rails.application.routes.draw do
  root 'welcome#index'

  get "/admin/candies",             to: "admin/candies#index"
  get "/admin/candies/new",         to: "admin/candies#new"
  get "/admin/candies/:id",         to: "admin/candies#show"
  post "/admin/candies",            to: "admin/candies#create"
  get "/admin/candies/:id/edit",    to: "admin/candies#edit"
  patch "/admin/candies/:id",       to: "admin/candies#update"

  get "/admin/dashboard/:id",       to: "admin/dashboard#show"

  get "/candies",                   to: "candies#index"
  get "/candies/:id",               to: "candies#show"

  get "/categories",                to: "categories#index"
  get "/categories/:id",            to: "categories#show"

  get "/reviews",                   to: "reviews#new"
  post "/reviews",                  to: "reviews#create"

  get "/register",                  to: "users#new"

  get "/login",                     to: "sessions#new"
  post "/login",                    to: "sessions#create"
  delete "/logout",                 to: "sessions#destroy"

  post "/users",                    to: "users#create"
  get "/dashboard",                 to: "users#show"

  post "/carts",                    to: "carts#create"
  get "/cart",                      to: "carts#show"
  put "/cart",                      to: "carts#update"
  delete "/cart",                   to: "carts#destroy"

  resources :orders, only: [:index, :show, :create]

  get "/order_success", to: "order_success#show"

  resources :custom_candies, only: [:new, :create, :show, :index, :update]
end
