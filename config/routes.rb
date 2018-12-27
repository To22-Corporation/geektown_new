# frozen_string_literal: true

Rails.application.routes.draw do
  root 'groups#index'
  get 'login' => 'users/sessions#new', as: :new_login
  post 'login' => 'users/sessions#create'
  post 'logout' => 'users/sessions#destroy'

  resource :registration, only: %i[new create]

  namespace :user do
    resources :groups, only: %i[create index destroy]
    resource :profile, only: %i[new create show edit update]
  end

  resources :users, module: :users, only: %i[index] do
    resource :profile, only: %i[show]
  end

  resources :groups, only: %i[new create edit update index show destroy] do
    scope module: :groups do
      resources :messages, only: %i[index create]
    end
  end

  resources :questions, only: %i[index show] do
    scope module: :questions do
      resources :answers, only: %i[create]
    end
  end
end
