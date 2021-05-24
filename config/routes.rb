Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :teachers

  resources :exercises

  resources :students do
    resources :trainings
  end

end