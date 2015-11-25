Rails.application.routes.draw do

  resources :orders
  devise_for :users

  root 'orders#index'
  
  get 'orders/new', as: 'user_root'
  
end
