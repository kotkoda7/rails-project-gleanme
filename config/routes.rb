Rails.application.routes.draw do
  resources :location_edibles
  resources :locations
  resources :users
  resources :edibles

  root to: 'locations#home'

  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
