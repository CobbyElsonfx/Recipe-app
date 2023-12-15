class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :calculate_total_price_from_recipe_foods

  private

  def calculate_total_price_from_recipe_foods(recipe_foods)
    recipe_foods.sum { |recipe_food| recipe_food.food.price * recipe_food.quantity }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
