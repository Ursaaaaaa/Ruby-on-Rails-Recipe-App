# frozen_string_literal: true

Rails.application.routes.draw do
  get 'general_shopping_lists/index'
  get 'shopping_list/:recipe_id/:inventory_id', to: 'shopping_list#index', as: :shopping_list
  devise_for :users
  root 'recipes#index'
  resources :recipes
  resources :food_recipes
  resources :foods
  resources :public_recipes
  resources :inventories
  resources :inventory_food
  resources :general_shopping_lists, only: %i[index], path: '/general_shopping_list'
  # resources :shopping_list, only: %i[index], path: '/shopping_list'
  resources :shopping_list
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
