Rails.application.routes.draw do

  resources :courses

  root 'statics#welcome'

  get '/mycourses', to: 'courses#mycourses' 

  devise_for :users
  
end
