Rails.application.routes.draw do
  get '/users/:author_id/posts', to: 'posts#index'
  get '/users/:author_id/posts/:id', to: 'posts#show'
  get '/', to: "users#index"
  get '/users/:id', to: "users#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
end
