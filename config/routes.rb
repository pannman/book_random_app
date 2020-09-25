Rails.application.routes.draw do
  root 'random_books#new'
  get '/random', to: 'random_books#new'
  get  '/books', to: 'random_books#index'
  get '/book',   to: 'random_books#show'
  post '/random',to: 'random_books#create' 
end
