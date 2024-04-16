class Api::AuthenticationController < ApplicationController
  class AuthenticationError < StandardError; end

  rescue_from AuthenticationError, with: :invalid_credentials

  def login
    user = User.find_by(email: login_params[:email])
    raise AuthenticationError unless user

    valid_password = user.authenticate(login_params[:password])
    raise AuthenticationError unless valid_password

    token = JsonWebToken.encode({ email: user[:email] })
    user_data = user.as_json(only: %i[id email name])

    render json: { token:, **user_data }, status: :ok
  end

  private

  def login_params
    params.require(:authentication).permit(:email, :password)
  end

  def invalid_credentials
    render json: { errors: ['authentication: Invalid credentials.'] }
  end
end
