Rails.application.routes.draw do
  devise_for :users
  get '/books/search' => 'books#search'
end