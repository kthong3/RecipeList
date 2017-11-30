class PinnedRecipesController < ApplicationController

  def create
    PinnedRecipe.create(user: current_user, recipe: Recipe.find(params[:recipe_id]))
    redirect_to user_path(current_user)
  end

  def destroy
    PinnedRecipe.find_by(user: current_user, recipe: Recipe.find_by(id: params[:id])).destroy
    redirect_to user_path(current_user)
  end
end
