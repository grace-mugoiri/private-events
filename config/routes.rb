Rails.application.routes.draw do
  
  get 'static_pages/home'
  get 'sessions/new'
  resources :users
  get "/signup", to: "users#new"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/home', to: 'static_pages#home'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
