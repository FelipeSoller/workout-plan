Rails.application.routes.draw do
  resources :clients
  root 'home#index'
  devise_for :users
  resources :muscle_groups
  resources :plans
#   get 'home/index'
end
