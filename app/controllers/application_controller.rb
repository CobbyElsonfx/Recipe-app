class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
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

  def after_sign_in_path_for(_resource)
    foods_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
