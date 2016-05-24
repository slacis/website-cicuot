Rails.application.routes.draw do
  resources :posts
  resources :reviews
  get 'homepage/index'
  root 'homepage#index'
end
