Rails.application.routes.draw do
  #resources :location_edibles
  
  root to: 'locations#home'

  resources :locations
  resources :users
  

  resources :edibles, only: [:index] do
    resources :locations, only: [:index]
  end




  #If you need to use a different controller namespace inside a namespace block you can specify an absolute controller path
  resources :sessions, only: [:new, :create, :destroy]

  get '/signup' => 'users#new'
  
  get '/login' => 'sessions#new'
  #post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'


    resources :users do
      resources :locations
  end
end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
