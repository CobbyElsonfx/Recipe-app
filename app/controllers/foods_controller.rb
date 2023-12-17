class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = current_user.foods
  end

  def shopping_list
    @foods_needed = RecipeFood
      .joins(:food, :recipe)
      .select('foods.*, recipe_foods.quantity AS quantity_needed')
      .where('recipes.user_id = ? AND foods.quantity < recipe_foods.quantity', current_user.id)
      .distinct

    @total_items = @foods_needed.length
    @total_value = @foods_needed.sum do |food_needed|
      (food_needed.quantity_needed - food_needed.quantity) * food_needed.price
    end
  end

  def new
    @food = current_user.foods.build
  end

  def create
    @food = current_user.foods.build(food_params)
    @food.quantity = 1

    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food was successfully deleted.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
