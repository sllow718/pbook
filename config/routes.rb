Rails.application.routes.draw do
  devise_for :users
  root to: 'stalls#index'

  resources :stalls
  resources :dishes do
    get 'bookmarks', to: 'bookmarks#bookmark'
  end
    resources :dishes, only: [ :index, :show ] do
    resources :reviews, only: :create
  end

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
