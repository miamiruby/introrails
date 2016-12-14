Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars
  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'

  get '/search' => 'home#search'
  get '/about_us' => 'home#about_us'
  root 'home#index'
end
