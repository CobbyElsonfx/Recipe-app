class ApplicationController < ActionController::Base
    helper_method :calculate_total_price_from_recipe_foods
  
    private
  
    def calculate_total_price_from_recipe_foods(recipe_foods)
      recipe_foods.sum { |recipe_food| recipe_food.food.price * recipe_food.quantity }
    end
  end