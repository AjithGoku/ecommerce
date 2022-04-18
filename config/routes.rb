Rails.application.routes.draw do
  # devise_for :users => this is used for without users controller folder
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # Use root "home#index" (or) root to: "home#index" no diff
  root to: "home#index"
  get 'home/index'
  resources :users
  resources :products
  resources :stock_statuses
  resources :discounts
  resources :product_categories
end
