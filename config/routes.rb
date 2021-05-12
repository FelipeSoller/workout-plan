Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :plans
#   get 'home/index'
end
