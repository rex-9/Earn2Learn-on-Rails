Rails.application.routes.draw do
  resources :technologies do
    resources :studies
    resources :certificates
  end

  resources :users do
    resources :studies
    resources :certificates
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
