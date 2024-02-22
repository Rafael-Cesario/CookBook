class Api::ListController < ApplicationController
  def create
    list = List.new(list_params)
    list.save!
    render json: list, status: :created
  rescue
    render json: list.errors, status: :unprocessable_entity
  end

  private

  def list_params
    params.require(:list).permit(:user_id, :title)
  end
end
