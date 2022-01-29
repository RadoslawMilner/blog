Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"
  resources :articles do
    resources :comments
  end
  # get "home/index"
  # Defines the root path route ("/")
  # root "articles#index"
  # root to: "home#index"
end
