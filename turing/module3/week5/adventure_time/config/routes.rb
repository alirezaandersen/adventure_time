Rails.application.routes.draw do

  root 'users#index'

  resources :weathers, only: [:new, :create, :show]
  resources :city_parks, only:[:index, :new, :create, :show]
  resources :state_parks, only:[:index, :new, :create, :show]
  resources :national_parks, only:[:index, :new, :create, :show] 

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
