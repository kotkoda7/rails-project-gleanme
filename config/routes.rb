Rails.application.routes.draw do
  
  root to: 'locations#home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  #post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :locations do
    resources :edibles
  end

  resources :edible_categories do
    resources :edibles
  end

    resources :users do
      resources :locations
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
