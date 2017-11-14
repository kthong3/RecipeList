class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = params[:recipe]
    @recipe = Recipe.create(title: recipe[:title], cook_time: recipe[:cook_time], ingredients: recipe[:ingredients], instructions: recipe[:instructions])
    p @recipe
    PinnedRecipe.create(user: current_user, recipe: @recipe)
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
