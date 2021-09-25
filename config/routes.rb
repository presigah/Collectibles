Rails.application.routes.draw do
  
  root "welcome#index"
  get 'singup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :users
  resources :figures

end
