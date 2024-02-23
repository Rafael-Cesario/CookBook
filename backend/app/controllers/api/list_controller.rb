class Api::ListController < ApplicationController
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

  private

  def list_params
    params.require(:list).permit(:user_id, :title)
  end
end
