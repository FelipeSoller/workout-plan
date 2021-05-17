Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :students
  resources :teachers
  resources :trainings
  resources :exercises
end
