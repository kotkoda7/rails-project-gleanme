Rails.application.routes.draw do
  
  root to: 'locations#home'

  resources :locations
  resources :users
  
  
  resources :edibles do
    resources :edible_categories
  end

  resources :sessions, only: [:new, :create, :destroy]

  get '/signup' => 'users#new'
  
  get '/login' => 'sessions#new'
  #post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'


    resources :users do
      resources :locations
  end


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
