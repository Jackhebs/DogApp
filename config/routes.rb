# frozen_string_literal: true
Rails.application.routes.draw do
  resources :dogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'home', to: 'application#home'
  #root 'application#home'
  root 'dogs#index'
  get 'application/about'
end