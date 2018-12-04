# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  get 'login' => 'users/sessions#new', as: :new_login
  post 'login' => 'users/sessions#create'
  post 'logout' => 'users/sessions#destroy'

  resource :registration, only: %i[new create]
  resources :users, only: %i[] do
    resource :profile, only: %i[new create edit update]
  end
end
