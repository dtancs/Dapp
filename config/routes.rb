Rails.application.routes.draw do

  resources :users
  resources :microposts,          only: [:create, :destroy]

  get  '/home', to: 'static_pages#home'
  get  '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
