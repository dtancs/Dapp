Rails.application.routes.draw do
  resources :users

  get  '/home', to: 'static_pages#home'
  get  '/register', to: 'users#new'
  
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
