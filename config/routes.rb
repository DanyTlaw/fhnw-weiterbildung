Rails.application.routes.draw do

  root 'statics#welcome'

  resources :profils
  resources :courses

  get '/myprofil', to: 'profils#myprofil'
  get '/dashboard', to: 'statics#dashboard'
  get '/mycourses', to: 'courses#mycourses' 
  get '/payemail', to: 'statics#sendPayMail'
  get '/ademail', to: 'statics#sendAdMail'
  get '/pricelist', to: 'statics#pricelist'

  devise_for :users
  
end
