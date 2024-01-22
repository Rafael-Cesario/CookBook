class UserController < ApplicationController
  def create
    user = User.new(user_params)
    user.save!
    render json: user.as_json(except: [:created_at, :updated_at, :password_digest]), status: :created
  rescue StandardError
    render json: { errors: user.errors }, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
