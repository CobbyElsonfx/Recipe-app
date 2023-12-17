class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy toggle_public]
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      flash.now[:alert] = @recipe.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  def toggle_public
    if @recipe.user == current_user
      @recipe.update(public: !@recipe.public)
      redirect_to @recipe, notice: 'Recipe visibility changed.'
    else
      redirect_to @recipe, alert: 'You are not authorized to perform this action.'
    end
  end

  def generate_shopping_list
    @recipe = Recipe.find(params[:id])

    @shopping_list_items = @recipe.recipe_foods.includes(:food).map do |recipe_food|
      {
        food_name: recipe_food.food.name,
        quantity_needed: recipe_food.quantity,
        total_price: recipe_food.food.price * recipe_food.quantity
      }
    end

    respond_to do |format|
      format.html { render :shopping_list }
    end
  end

  def shopping_list
    @ingredients = @recipe.recipe_foods.includes(:food)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :public, :preparation_time, :cooking_time)
  end
end
