Rails.application.routes.draw do

  resources :videos
  root to: 'books#index'

  resources :books

  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:show, :index]

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
