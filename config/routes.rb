Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/home', to: 'pages#home'
 
  resources :articles do
    member do
      post 'like'
    end
  end
  
  resources :users, except: [:new]
  
  get '/register', to: 'users#new'
  
  
  
  
end