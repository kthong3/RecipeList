class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    p recipe_params
    @recipe = Recipe.new(recipe_params)
    @recipe.author = current_user
    @recipe.save
    PinnedRecipe.create(user: current_user, recipe: @recipe)
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update_attributes(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:author, :title, :cook_time, :ingredients, :instructions, :image)
  end
end
