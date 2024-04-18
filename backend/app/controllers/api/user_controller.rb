class Api::UserController < ApplicationController
  def create
    render json: { message: "User controller" }, status: :ok
  end
end
