Rails.application.routes.draw do
  resources :plans
#   get 'home/index'
  root 'home#index'
end
