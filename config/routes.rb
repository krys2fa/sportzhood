Rails.application.routes.draw do
  resources :categories
  resources :users
  resources :sessions, only: [:index, :create, :destroy]
  resources :tags, only: [:show]

  resources :articles do
    resources :comments, only: [:create]
    resources :votes, only: [:create, :destroy]
  end

  root to: "articles#index"
end
