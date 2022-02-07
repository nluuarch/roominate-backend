Rails.application.routes.draw do
  resources :users #all routes
  resources :user_photos, only:[:show, :create, :update]

  resources :listings #all routes
  resources :listing_photos, only:[:show, :create, :update]

  resources :reviews, only:[:show, :create, :destroy]
  resources :user_reviews, only:[:show, :create, :destroy]

  resources :messages, only:[:index, :show, :create, :destroy] 
  resources :conversations, only:[:index, :show, :create, :destroy] 

  # for user authentication
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  get "/auth", to: "application#authorize"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

end
