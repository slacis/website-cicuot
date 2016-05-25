Rails.application.routes.draw do
  resources :posts
  resources :reviews
  resources :contacts, only: [:new, :create]
  get 'homepage/index'
  root 'homepage#index'
end
