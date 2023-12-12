# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations',
             }

  root to: redirect('/home')

  resources :home, only: %i[index]
  resources :explore, only: %i[index]
  resources :notifications, only: %i[index]

  resources :users, param: :name, path: '/', only: %i[show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
