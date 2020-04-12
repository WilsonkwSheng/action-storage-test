Rails.application.routes.draw do
  devise_for :users
  resources :chatrooms
  resources :messages
  resources :users
  root 'chatrooms#index'
end
