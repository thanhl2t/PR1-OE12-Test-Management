Rails.application.routes.draw do
  get "session/new"
  get "users/new"
  root "session#new"
  get "/signup", to: "user#new"
  post "/signup", to: "user#create"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
  get "users/show", to: "users#show"
  resources :users
end