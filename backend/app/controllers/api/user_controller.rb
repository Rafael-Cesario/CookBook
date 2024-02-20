module Api
  class UserController < ApplicationController
    def create
      render json: { message: "Hello" }
    end
  end
end
