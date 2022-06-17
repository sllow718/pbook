Rails.application.routes.draw do
  devise_for :users
  root to: 'stalls#index'
  resources :stalls
  resources :dishes do
    get 'bookmarks', to: 'bookmarks#bookmark'
    resources :reviews
  end

  resources :reviews do
    resources :review_flavors
  end

  get 'mystalls', to: 'stalls#mystallsindex'

  resources :bookmarks
  end
