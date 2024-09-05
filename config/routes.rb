Rails.application.routes.draw do
  devise_for :users

  get :dashboard, to: "dashboard#index"

  match '/users',   to: 'users#index',   via: 'get'

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
