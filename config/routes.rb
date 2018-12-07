# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users/profiles#new'
  get 'login' => 'users/sessions#new', as: :new_login
  post 'login' => 'users/sessions#create'
  post 'logout' => 'users/sessions#destroy'

  resource :registration, only: %i[new create]
  resources :users, module: :users, only: %i[index] do
    resource :profile, only: %i[new create edit update]
  end
end
