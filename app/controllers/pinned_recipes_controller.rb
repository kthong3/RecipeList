class PinnedRecipesController < ApplicationController

  def create
    PinnedRecipe.create(user: current_user, recipe: Recipe.find(params[:recipe_id]))
    p "success"
  end

  def destroy
    p params
    PinnedRecipe.where(user: current_user, recipe: Recipe.find_by(id: params[:id])).destroy
    # p pinned_recipe
    # pinned_recipe.destroy
  end
end
