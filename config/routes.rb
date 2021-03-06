require 'sidekiq/web'

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users
  resources :chatrooms
  resources :messages
  resources :users
  root 'chatrooms#index'

  mount Sidekiq::Web => '/sidekiq'
end
