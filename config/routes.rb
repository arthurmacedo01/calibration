Rails.application.routes.draw do
  resources :order_items, only: [:index, :create, :show, :edit, :update, :destroy]
  get '/order_items/:order_id/new', to: 'order_items#new', as: 'new_order_item_path'
  resources :orders
  resources :equipment
  resources :clients
  resources :services
  resources :sections
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
