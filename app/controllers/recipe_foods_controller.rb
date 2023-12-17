class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe
  before_action :set_recipe_food, only: %i[edit update destroy]
  before_action :check_recipe_ownership, only: %i[new create edit update destroy]

  def new
    @recipe_food = @recipe.recipe_foods.build
    @foods = current_user.foods
  end

  def create
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully added.'
    else
      @foods = current_user.foods
      render :new
    end
  end

  def edit
    @foods = Food.all
  end

  def update
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully updated.'
    else
      @foods = Food.all
      render :edit
    end
  end

  def destroy
    @recipe_food.destroy
    redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully removed.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_recipe_food
    @recipe_food = @recipe.recipe_foods.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end

  def check_recipe_ownership
    return if @recipe.user == current_user

    redirect_to recipes_path,
                alert: 'You are not authorized to perform this action.'
  end
end
