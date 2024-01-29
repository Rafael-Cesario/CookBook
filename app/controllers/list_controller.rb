class ListController < ApplicationController
  class NotFoundError < StandardError; end

  rescue_from NotFoundError, with: :list_not_found


  def create
    list = List.new(list_params)
    list.save!
    render json: list.as_json(except: %i[created_at updated_at]), status: :ok
  rescue StandardError
    render json: { errors: list.errors }, status: :unprocessable_entity
  end

  def index
    lists = List.where(user_id: params.require(:user_id))
    render json: { lists:, total: lists.length }, status: :ok
  end

  def update
    list = List.find_by_id(params.require(:id))
    raise NotFoundError unless list

    list.title = params.require(:title)
    list.save!

    render json: list, status: :ok
  rescue StandardError
    render json: { errors: list.errors }, status: :unprocessable_entity
  end

  def destroy
    list = List.find(params.require(:id))
    list.destroy
    render json: { message: "Sucess: List #{list.title} was removed." }, status: :ok
  rescue StandardError
    render json: { errors: ['notFound: List not found'] }, status: :unprocessable_entity
  end

  private

  def list_params
    params.require(:list).permit(:title, :user_id)
  end

  def list_not_found
    render json: { errors: ['notFound: A list with the current id was not found'] }, status: :not_found
  end
end
