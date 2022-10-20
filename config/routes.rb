Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/create'
  post 'posts/index'
  post 'users/sign_out', to: 'sessions#destroy', as: :sign_out
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "posts#index"

  resources :posts
  resources :users
end
