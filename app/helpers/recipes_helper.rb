module RecipesHelper
  def calculate_total_price_from_recipe_foods(recipe_foods)
    total_price = 0
    recipe_foods.each do |recipe_food|
      total_price += recipe_food.food.price * recipe_food.quantity
    end
    total_price
  end
end
