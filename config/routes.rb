Rails.application.routes.draw do
  resources :cars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  get '/search' => 'home#search'
  get '/about_us' => 'home#about_us'
  get '/' => 'home#index'
end
