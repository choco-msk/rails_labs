Rails.application.routes.draw do

  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/signout', to: 'sessions#destroy'
  root 'posts#index'
  get 'main/profile'
  get 'session/destroy'
  resources :sessions, only: %i[new create destroy]
  resources :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
end
