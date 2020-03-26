Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :friend_requests, only: [:create, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
