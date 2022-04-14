Rails.application.routes.draw do
  get 'orders/index', to: 'orders#index'

  get 'orders/show', to: 'orders#show'

  get 'orders/new', to: 'orders#new'

  get 'orders/edit', to: 'orders#edit'

  get 'orders/destroy', to: 'orders#destroy'

  root 'orders#index'

  resources :orders
end
