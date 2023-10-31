Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get 'pages/product' => 'pages#product'

  get 'pages/laptop' => 'pages#laptop'

  get '/signup' => 'pages#registration'
  get '/signin' => 'pages#signin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
