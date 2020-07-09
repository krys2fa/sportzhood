Rails.application.routes.draw do
  resources :votes
  resources :categories
  resources :articles

  devise_for :users#, :controllers => { registrations: 'registrations' }

  # devise_scope :user do
  #  get "signup", to: "devise/registrations#new"
  #  get "login", to: "devise/sessions#new"
  #  get "logout", to: "devise/sessions#destroy"
  # end


  # resources :articles, only: [:index, :create] do
  #   resources :comments, only: [:create]
  #   resources :votes, only: [:create, :destroy]
  # end

  root to: "articles#index"
end
