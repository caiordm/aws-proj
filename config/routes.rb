Rails.application.routes.draw do
  devise_for :users
  get '/users',  to: 'users#index'
  
  root "home#index"  
  
  resources :articles
  get :dashboard, to: "dashboard#index"
  
  
  
  get "up" => "rails/health#show", as: :rails_health_check
end
