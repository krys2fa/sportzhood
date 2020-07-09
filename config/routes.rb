Rails.application.routes.draw do
  resources :votes
  resources :categories

  resources :articles do
    # resources :comments, only: [:create]
    resources :votes, only: [:create, :destroy]
  end

  root to: "articles#index"
end
