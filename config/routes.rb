Rails.application.routes.draw do

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

  get  '/home', to: 'static_pages#home'
  get  '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'static_pages#home'

  #api
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :microposts, only: [:index, :create, :show, :update, :destroy]

      get '/feed/:id',  to: 'feed#show'
      post '/login',  to: 'sessions#create'
      delete '/logout/:id/:mobile_token',  to: 'sessions#destroy'

      post '/relationship',  to: 'relationships#create'
      get '/relationships/:id',  to: 'relationships#show'
    end
  end

end
