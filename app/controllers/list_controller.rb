class ListController < ApplicationController
  def create
    list = List.new(list_params)
    list.save!
    render json: { list:, user: list.user }, status: :ok
  rescue StandardError
    render json: list.errors, status: :unprocessable_entity
  end

  private

  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end
