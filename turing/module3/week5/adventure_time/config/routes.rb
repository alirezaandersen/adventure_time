Rails.application.routes.draw do

  root 'welcome#index'

  resources :weathers, only: [:new, :create, :show]

  get '/json/weather', to: 'weathers#json', defaults:{format: :json}
  get '/forecast/weather/', to: 'weathers#forecast', defaults:{format: :js}

  resources :parks, only:[:new]

  get '/parks/directions', to: 'parks#directions', defaults:{format: :js}
  get 'parks/search', to: 'parks#search'
  get 'parks/national_search', to: 'parks#national_search'

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
