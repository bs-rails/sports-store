Rails.application.routes.draw do
  resources :orders
  resources :cart_lines
  resource :cart
  resources :products
  devise_for :users
  root "home#index"
end
