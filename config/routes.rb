Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :reviews
  resources :contacts, only: [:new, :create]
  get 'homepage/index'
  root 'homepage#index'

  get '*path' => redirect{'/'}
end
