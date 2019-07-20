Rails.application.routes.draw do
  root 'sessions#welcome'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users, except: [:new, :create]
  #get '/beers/:id/edit', to:'beers#edit', as: 'edit_beers'
  resources :beers
  get '/beers/:id' , to: 'beers#destroy'
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
