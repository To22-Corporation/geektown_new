Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :user_sessions

  get 'login' => 'user_sessions#new'
  post 'logout' => 'user_sessions#destroy'
end
