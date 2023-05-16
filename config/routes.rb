Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"

  # Page Not Found
  get "*path", to: "pages#not_found", constraints: lambda { |req| req.path.exclude? "rails/active_storage" }
end
