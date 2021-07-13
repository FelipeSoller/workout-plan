Rails.application.routes.draw do

  default_url_options :host => "example.com"
  
  root 'home#index'

  devise_for :users

  resources :teachers
  # , except: [:index, :show, :edit, :destroy]

  resources :exercises

  resources :students do
    resources :trainings
  end

  get '/trainings', to: 'trainings#index'

end