class Api::ListController < ApplicationController
  NOT_FOUND_ERROR =  "notFound: A list with id: %s was not found."

  before_action :authorize

  def create
    list = List.new(list_params)
    list.save!
    render json: list, status: :created
  rescue
    render json: list.errors, status: :unprocessable_entity
  end

  def index
    lists = List.where(user_id: params.require(:user_id))
    render json: { lists:, total: lists.length }
  end

  def update
    list = List.find_by(id: params.require(:id))
    raise StandardError.new NOT_FOUND_ERROR % params[:id] unless list

    list.update(title: params.require(:title))
    raise StandardError.new list.errors.first.full_message unless list.valid?

    render json: list, status: :ok
  rescue => error
    render json: { error: error.message }, status: :unprocessable_entity
  end

  def destroy
    list = List.find_by(id: params.require(:id))
    raise StandardError.new NOT_FOUND_ERROR % params[:id] unless list
    list.destroy
    render json: { id: list[:id], title: list[:title], message: "Success: List deleted."}, status: :ok
  rescue => error
    render json: { error: error.message }, status: :unprocessable_entity
  end

  private

  def list_params
    params.require(:list).permit(:user_id, :title)
  end
end
