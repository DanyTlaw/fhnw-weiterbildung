Rails.application.routes.draw do

  resources :courses

  root 'statics#welcome'

  get '/mycourses', to: 'courses#mycourses' 
  get '/home' , to: 'statics#home'
  
  devise_for :users
  
end
