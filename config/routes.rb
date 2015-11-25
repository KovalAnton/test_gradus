Rails.application.routes.draw do

  resources :orders
  devise_for :users
  root 'home#index'
  get 'persons/profile', as: 'user_root'
  
end
