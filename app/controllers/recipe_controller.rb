class RecipeController < ApplicationController
  def create
    recipe = Recipe.new(recipe_params)
    recipe.save!
    render json: recipe, status: :created
  rescue StandardError
    render json: recipe.errors, status: :unprocessable_entity
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :list_id, :cooking_time, :instructions)
  end
end
