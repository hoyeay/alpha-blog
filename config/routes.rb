Rails.application.routes.draw do
  # set main web page
  root 'pages#home'
  
  # add resources to articles
  resources :articles
  
  # set about page
  get 'about', to: 'pages#about'
  # set sigup page
  resources :users, except: [:new]
  get 'signup', to: 'users#new'

end
