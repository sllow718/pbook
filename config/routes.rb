Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :stalls
  resources :dishes do
    get 'bookmarks', to: 'bookmarks#bookmark'
    get 'bookmarks', to: 'bookmarks#unbookmark'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
