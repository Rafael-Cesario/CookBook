class Api::UserController < ApplicationController
  class UserError < StandardError; end

  def create
    user = User.new(user_params)
    raise UserError unless user.save
    response = { id: user[:id], email: user[:email], message: "A new user was created with success" }
    render json: response, status: :ok
  rescue
    render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
