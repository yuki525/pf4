Rails.application.routes.draw do
  root 'tasks#index'
  get 'tasks/search'
  resources :tasks
  get 'sessions/index'
  get 'sessions/new'

  resources :users, only: [:new, :create, :edit, :update, :destroy]

 
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
