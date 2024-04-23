class Api::AuthenticationController < ApplicationController
  class InvalidCredentials < StandardError; end

  rescue_from InvalidCredentials, :with => :invalid_credentials

  def login
    user = User.find_by(email: login_params[:email].downcase)

    raise InvalidCredentials unless user
    raise InvalidCredentials unless user.authenticate(login_params[:password])

    message = "Success: Token created"
    token = JsonWebToken.encode(user_id: user[:id])
    response = { message:, token:, id: user[:id], email: user[:email] }

    render json: response, status: :ok
  end

  private

  def login_params
    params.require(:authentication).permit(:email, :password)
  end

  def invalid_credentials
    message =  "InvalidCredentials: Your email or password is not valid."
    render json: { message: }, status: :unauthorized
  end
end
