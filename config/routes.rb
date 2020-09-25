Rails.application.routes.draw do
  root 'random_books#new'
  get '/random', to: 'random_books#new'
  get  '/books',    to: 'random_books#index'
end
