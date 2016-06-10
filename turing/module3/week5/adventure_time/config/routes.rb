Rails.application.routes.draw do

  root 'parks#search'

  resources :weathers, only: [:new, :create, :show]

  get '/json/weather', to: 'weathers#json', defaults:{format: :json}

  resources :parks, only:[:index, :new, :create, :show]

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
