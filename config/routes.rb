Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
#   # root "articles#index"
#   resources :users, only: [:index, :show] do
#     resources :posts, only: [:index, :new, :create, :show, :destroy] do
#       resources :comments, only: [:new, :create, :destroy]
#       resources :likes, only: [:create]
#     end
#   end
# end
namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
        end
      end
    end
  end

