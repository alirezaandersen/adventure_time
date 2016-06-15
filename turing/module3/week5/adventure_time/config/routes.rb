Rails.application.routes.draw do

  root 'welcome#index'

  get '/json/weather', to: 'weathers#json', defaults:{format: :json}
  get '/forecast/weather/', to: 'weathers#forecast', defaults:{format: :js}

  resources :parks, only:[:new]

  get '/parks/directions', to: 'parks#directions', defaults:{format: :js}
  get 'parks/search', to: 'parks#search'
  get 'parks/national_search', to: 'parks#national_search'
  get 'parks/state_search', to: 'parks#state_search'

  resources :users, only:[:index]

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
