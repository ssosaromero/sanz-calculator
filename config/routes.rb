Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/calc', to: 'calculator#calculate'
  get '/history', to: 'calculator#history'

  # Defines the root path route ("/")
  root 'calculator#index'
  # root "articles#index"
end
