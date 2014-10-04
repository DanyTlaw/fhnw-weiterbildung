Rails.application.routes.draw do
  
  root 'statics#welcome'

  devise_for :users
  
end
