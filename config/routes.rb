Rails.application.routes.draw do
  resources :comments
  root 'sessions#welcome'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users, except: [:new, :create]
  resources :beers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
