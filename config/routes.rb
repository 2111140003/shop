
Rails.application.routes.draw do
  resources :products, except: [:show]
  root 'top#main'
  get 'top/main'
  resources :cart_items, only: [:new, :create, :destroy]
  resource :cart, only: [:show]
end
