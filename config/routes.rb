# frozen_string_literal: true

Rails.application.routes.draw do
  get 'foods/index'
  get 'foods/show'
  devise_for :users
  root 'recipes#index'
  resources :recipes
  resources :food_recipes
  resources :foods
  resources :public_recipes
  resources :inventory
  resources :inventory_food
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
