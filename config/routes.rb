Rails.application.routes.draw do
  root 'random_books#new'
  get '/random', to: 'random_books#new'
  post '/random',to: 'random_books#create'
  resources :random_books, only:[:index,:show,:destroy]
end
