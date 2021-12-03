Rails.application.routes.draw do
  root 'tasks#index'
  get 'tasks/search'
  resources :tasks
  get 'sessions/index'
  get 'sessions/new'

  resources :users, only: [:new, :create, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
