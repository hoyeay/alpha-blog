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
  
  #get login page
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]
end
