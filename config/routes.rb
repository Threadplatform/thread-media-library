Rails.application.routes.draw do

  root to: 'books#index'

  concern :reviewable do
    resources :reviews
  end

  resources :books, concerns: :reviewable
  resources :videos, concerns: :reviewable

  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:show, :index]

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
