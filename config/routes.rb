Rails.application.routes.draw do
  get '/books/search' => 'books#search'
end