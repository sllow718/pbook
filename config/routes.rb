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

  resources :bookmarks
  get 'dashboard', to: 'dashboards#dashboard'
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
