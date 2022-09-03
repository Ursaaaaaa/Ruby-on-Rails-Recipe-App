class ShoppingListController < ApplicationController
  before_action :authenticate_user!
  def new
    @inventories = if current_user.nil?
                 []
               else
                 @current_user.inventories
               end
  end

  def index
    @total_price = 0
    @foods = current_user.foods.includes(:food_recipes).map do |food|
      next if food.food_recipes.empty?

      total_quantity = food.food_recipes.sum(:quantity)
      price = total_quantity * food.price
      @total_price += price

      {
        name: food.name,
        measurement_unit: food.measurement_unit,
        price: food.price
      }
    end.compact
    @recipes = current_user.recipes
    @inventories = current_user.inventories
  end
end
