Rails.application.routes.draw do
  post 'users/login', to: 'users#login'

  get '/studies', to: 'studies#all'

  get '/user/:id/technologies', to: 'professions#user'
  get '/technology/:id/users', to: 'professions#technology'

  resources :technologies do
    resources :studies, only: [:index]
    resources :certificates, only: [:index]
  end

  resources :users do
    resources :studies, only: [:index, :create]
  end

  resources :studies, only: [:show, :update, :destroy]
  resources :certificates, only: [:index, :show, :create, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
