Rails.application.routes.draw do
  post 'users/login', to: 'users#login'

  get '/studies', to: 'studies#all'

  get '/users/:id/technologies', to: 'professions#user'
  get '/users/:id/likes', to: 'likes#user'
  get '/users/:id/comments', to: 'comments#user'

  get '/technologies/:id/users', to: 'professions#technology'

  resources :technologies
  # do
  #   resources :studies, only: [:index]
  #   resources :certificates, only: [:index]
  # end

  resources :users do
    resources :studies, only: [:index]
  end

  resources :studies do
    resources :likes, only: [:index]
    resources :comments, only: [:index]
  end

  resources :studies, only: [:show, :create, :update, :destroy]
  resources :certificates, only: [:index, :show, :create, :update, :destroy]
  resources :likes, only: [:show, :create]
  resources :comments, only: [:show, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
