# frozen_string_literal: true

Rails.application.routes.draw do
  get 'general_shopping_lists/index'
  devise_for :users
  root 'recipes#index'
  resources :recipes
  resources :food_recipes
  resources :foods
  resources :public_recipes
  resources :inventory
  resources :inventory_food
  resources :general_shopping_lists, only: %i[index], path: '/general_shopping_list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
