Rails.application.routes.draw do
  # add articles table to resources
  resources :articles
  # set main web page
  root 'pages#home'
  # set about page
  get 'about', to: 'pages#about'
end
