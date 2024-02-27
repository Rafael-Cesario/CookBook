class Api::RecipeController < ApplicationController
  before_action :authorize

  def create
    recipe = Recipe.new(recipe_params)
    recipe.save!
    render json: recipe, status: :created
  rescue
    render json: recipe.errors, status: :unprocessable_entity
  end

  def index
    recipes = Recipe.where(list_id: params.require(:list_id))
    render json: { recipes:, total: recipes.length }, status: :ok
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :cooking_time, :list_id)
  end
end
