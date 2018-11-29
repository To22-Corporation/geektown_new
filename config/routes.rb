# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'

  resource :registration, only: %i[new create]
  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create', as: :post_login
  post 'logout' => 'user_sessions#destroy'

  resources :users, except: %i[new create destroy]
end
