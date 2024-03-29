class Api::RecipeController < ApplicationController
  before_action :authorize

  NOT_FOUND_ERROR =  "notFound: A recipe with id: %s was not found."

  def create
    recipe = Recipe.new(recipe_params)
    raise StandardError.new recipe.errors.full_messages.join(", ") unless recipe.save
    render json: recipe, status: :created
  rescue => error
    render json: { errors: error.message }, status: :unprocessable_entity
  end

  def index
    recipes = Recipe.where(list_id: params.require(:list_id))

    recipes = recipes.map do |recipe|
      next recipe unless recipe.cover.attached?
      recipe.attributes.merge({ cover: url_for(recipe.cover) })
    end

    render json: { recipes:, total: recipes.length }, status: :ok
  end

  def update
    recipe = Recipe.find_by(id: params.require(:id))
    raise StandardError.new NOT_FOUND_ERROR % params[:id] unless recipe

    recipe.update(recipe_params)
    errors = recipe.errors.full_messages.join(", ")
    raise StandardError.new errors unless recipe.valid?

    render json: { recipe:, message: "Success: Recipe updated" }, status: :ok
  rescue => error
    render json: { errors: error.message }, status: :unprocessable_entity
  end

  def destroy
    recipe = Recipe.find_by(id: params.require(:id))
    raise StandardError.new NOT_FOUND_ERROR % params[:id] unless recipe
    recipe.destroy
    render json: { recipe: { id: recipe[:id], title: recipe[:title] }, message: "Success: Recipe deleted." }
  rescue => error
    render json: { errors: error.message }, status: :bad_request
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :cooking_time, :list_id, :cover)
  end
end
