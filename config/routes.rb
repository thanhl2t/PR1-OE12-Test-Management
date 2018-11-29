Rails.application.routes.draw do
  get "sessions/new"
  get "users/new"
  root "sessions#new"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "users/show", to: "users#show"
  resources :users
end
