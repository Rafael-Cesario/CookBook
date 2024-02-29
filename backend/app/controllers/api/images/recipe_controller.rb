class Api::Images::RecipeController < ApplicationController
  NOT_FOUND_ERROR =  "notFound: A recipe with id: %s was not found."

  def create
    recipe = Recipe.find_by(id: params.require(:id))
    raise StandardError.new NOT_FOUND_ERROR % params[:id] unless recipe

    recipe.cover.attach params.require(:cover)
    url = url_for(recipe.cover)

    data = recipe.attributes.merge({ cover: url })
    render json: data, status: :created
  rescue => error
    render json: { errors: error.message }, status: :unprocessable_entity
  end
end
