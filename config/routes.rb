Rails.application.routes.draw do
  resources :coins
  resources :articles, only: [:show]
  # resources :user_coins
  post "/login", to: 'auth#login'
  get "/login", to: 'auth#login'

  delete "/users/:id", to: 'users#remove_favorite'
  post "/users/:id", to: 'users#add_favorite'

  post "/current_user", to: "auth#current"
  resources :users

end
