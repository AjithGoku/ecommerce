Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  resources :stock_statuses
  resources :discounts
  resources :product_categories
  root 'products#index'
end
