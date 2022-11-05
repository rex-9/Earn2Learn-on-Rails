Rails.application.routes.draw do
  post 'users/login', to: 'users#login'

  get '/user/:id/technologies', to: 'users_technologies#user'
  get '/technology/:id/users', to: 'users_technologies#technology'

  resources :users_technologies

  resources :technologies do
    resources :studies, only: [:index]
    resources :certificates, only: [:index]
  end

  resources :users do
    resources :studies, only: [:index]
    resources :certificates, only: [:index]
  end

  resources :studies, only: [:show, :create, :update, :destroy]
  resources :certificates, only: [:show, :create, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
