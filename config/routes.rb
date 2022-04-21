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
  get 'orders/index', to: 'orders#index'

  get 'orders/show', to: 'orders#show'

  #get 'orders/new', to: 'orders#new'
  #get 'orderitem/new', to: 'orderitem#new'

  get 'orders/edit', to: 'orders#edit'

  get 'orders/destroy', to: 'orders#destroy'
  #get 'ordersstatuses/new', to: 'ordersstatuses#new'
  #get 'ordersstatuses/edit', to: 'ordersstatuses#edit'
  resources :orders
  resources :order_items
  resources :order_statuses
  resources :products
  resources :stock_statuses
  resources :discounts
  resources :product_categories
end
