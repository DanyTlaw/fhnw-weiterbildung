Rails.application.routes.draw do

  resources :profils

  resources :courses

  root 'statics#welcome'

  get '/myprofil', to: 'profils#myprofil'
  get '/dashboard', to: 'statics#dashboard'
  get '/mycourses', to: 'courses#mycourses' 
  get '/home' , to: 'statics#home'
  get '/payemail/', to: 'statics#sendPayMail'
  get '/ademail/', to: 'statics#sendAdMail'
  get '/pricelist', to: 'statics#pricelist'

  devise_for :users
  
end
