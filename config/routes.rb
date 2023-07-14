Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"

  # Static Pages
  get "my_portfolio", to: "users#my_portfolio"

  # Friends
  get "my_friends", to: "users#my_friends"
  get "search_friends", to: "users#search"

  # Friendships
  resources :friendships, only: [:create, :destroy]

  # Stocks
  get "search_stocks", to: "stocks#search"

  # Users
  resources :users, only: [:show]

  # Page Not Found
  get "*path", to: "pages#not_found", constraints: lambda { |req| req.path.exclude? "rails/active_storage" }
end
