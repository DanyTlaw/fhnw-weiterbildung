Rails.application.routes.draw do

  resources :courses

  root 'statics#welcome'

  devise_for :users
  
end
