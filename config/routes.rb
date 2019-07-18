Rails.application.routes.draw do
  get 'search/articles'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'articles#index'

  resources :articles

  resources :replies

  get 'friends', to: 'pages#friends'

  get "myarticles", to: 'articles#myarticles'

  get "userarticles", to: 'articles#userarticles'

  get 'profile', to: 'pages#edit'
  patch 'profile', to: 'pages#update'

  get  'search', to: 'search#articles'
end
