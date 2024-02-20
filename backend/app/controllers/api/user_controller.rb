module Api
  class UserController < ApplicationController
    def create
      user = User.new(user_params)
      user.save!
      render json: user.as_json(only: [:id, :email, :name], root: true), status: :created
    rescue
      render json: user.errors, status: :unprocessable_entity
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :name)
    end
  end
end
