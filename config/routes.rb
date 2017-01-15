Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:index, :create] do
    collection do
      get 'search'
      post 'registration'
    end
  end
end