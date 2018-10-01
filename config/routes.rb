Rails.application.routes.draw do
  #resources :location_edibles
  
  resources :locations
  resources :users
  #resources :edibles

  root to: 'locations#home'

  #If you need to use a different controller namespace inside a namespace block you can specify an absolute controller path
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'


    resources :locations, only: [:index, :show] do
      resources :edibles, only: [:index, :show]
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
