# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations',
             }

  root to: 'landing#index'

  resources :landing, only: %i[index]

  resources :home, only: %i[index]
  resources :explore, only: %i[index]
  resources :notifications, only: %i[index]

  resources :posts, only: %i[new create show]
  resources :users, param: :name, path: '/', only: %i[show] do
    with_options module: :users do
      resources :posts, only: :index
      resources :replies, only: :index
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
