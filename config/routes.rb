Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_scope :user do
    # root :to => "devise/sessions#new"
    # get "sign_in", :to => "devise/sessions#new"
    get "sign_out", to: "devise/sessions#destroy"
    # get "sign_up", :to => "devise/registrations#new"
  end

  resources :users, only: [:show]

  namespace :admin do
    resources :categories, except: [:show]
    resources :products, except: [:show]
  end

  resources :payment_intents, only: [:create]
  resources :wished_products, only: [:create, :destroy, :index]
  resources :webhooks, only: [:create]

  root 'pages#home'

  get 'pages/product_detail' => 'pages#product_detail'

  get 'pages/laptop' => 'pages#laptop'

  get 'pages/profile' => 'pages#profile'

  get 'pages/product_category' => 'pages#product_category'

  get 'pages/cart' => 'pages#cart'

  get 'cart/show' => 'cart#show'

  post 'cart/add_product' => 'cart#add_product'

  post 'cart/remove_product' => 'cart#remove_product'

  post 'cart/delete_product' => 'cart#delete_product'

  post 'checkouts/check' => 'checkouts#check'

  post 'payments' => 'payments#create'

  get 'payments/:payment_id/order_details' => 'payments#order_details', as: :payment_order_details

  get 'payments/my_orders' => 'payments#my_orders', as: :my_orders

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
