class ListController < ApplicationController
  def create
    list = List.new(list_params)
    list.save!
    render json: { list:, user: list.user }, status: :ok
  rescue StandardError
    render json: list.errors, status: :unprocessable_entity
  end

  def index
    lists = List.where(user_id: params.require(:user_id))
    render json: { lists:, total: lists.length }, status: :ok
  end

  def update
    list = List.find(params.require(:id))
    list.title = params.require(:title)
    list.save!
    render json: list, status: :ok
  rescue StandardError
    render json: list.errors, status: :unprocessable_entity
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
end
