Rails.application.routes.draw do
  devise_for :users
  resources :plans
#   get 'home/index'
  root 'home#index'
end
