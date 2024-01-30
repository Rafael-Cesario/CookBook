class RecipeController < ApplicationController
  def create
    recipe = Recipe.new(recipe_params)
    recipe.save!
    render json: recipe, status: :created
  rescue StandardError
    render json: { errors: recipe.errors }, status: :unprocessable_entity
  end

  def index
    recipes = Recipe.where(list_id: params.require(:list_id))
    render json: { recipes:, total: recipes.length }, status: :ok
  end

  def update
    recipe = Recipe.find(params.require(:id))

    recipe.update!(
      title: params[:title],
      ingredients: params[:ingredients],
      instructions: params[:instructions],
      cooking_time: params[:cooking_time]
    )

    render json: recipe, status: :ok
  rescue StandardError
    render json: { errors: recipe.errors }, status: :unprocessable_entity
  end

  def destroy
    recipe = Recipe.find(params.require(:id))
    recipe.destroy
    render json: { message: "Success: #{recipe.title} deleted with success." }
  rescue StandardError
    render json: { errors: ['notFound: Recipe id not found'] }
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :list_id, :cooking_time, :instructions)
  end
end
