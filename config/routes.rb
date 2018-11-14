Rails.application.routes.draw do
  get "sessions/new"
  scope "(:locale)", locale: /en|vi/ do
    get "users/new"
    get "users/show", to: "users#show"
    get "/signup", to: "users#new"
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/session", to: "static_pages#session"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
  end
end