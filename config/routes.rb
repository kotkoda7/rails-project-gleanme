Rails.application.routes.draw do
  
  root to: 'locations#home'

  get '/auth/google_auth2/callback' => 'sessions#create'

 resources :users, only: [:show] do
    resources :locations
  end

get 'users/:id/locations/:id' => 'users#show', :as => :user_location_path

  
resources :locations, only: [:index, :show, :new, :create] 
  resources :users
  
  resources :sessions, only: [:new, :create, :destroy]
  
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #resources :locations do
    #resources :edibles
  #end

  
  resources :edibles
    resources :categories

    resources :edible_locations
 #end



  #devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end