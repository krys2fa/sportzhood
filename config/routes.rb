Rails.application.routes.draw do
  resources :votes
  resources :categories
  resources :articles
  # devise_for :users

  devise_for :users, :controllers => { registrations: 'registrations' }

  # devise_scope :user do
  #  get "signup", to: "devise/registrations#new"
  #  get "login", to: "devise/sessions#new"
  #  get "logout", to: "devise/sessions#destroy"
  # end

  # devise_scope :user do
  #   root to: "posts#index"
  # end

  root to: "articles#index"
end
