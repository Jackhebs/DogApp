# frozen_string_literal: true
Rails.application.routes.draw do
  resources :dog_foods
  resources :foods
  resources :dogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'home', to: 'application#home'
  get 'about', to: 'application#about'

  root 'dogs#index'
end