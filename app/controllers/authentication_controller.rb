class AuthenticationController < ApplicationController
  class AuthenticationError < StandardError; end

  rescue_from AuthenticationError, with: :invalid_credentials

  def login
    user = User.find_by(email: params.require(:email))
    raise AuthenticationError unless user

    valid_password = user.authenticate(params.require(:password))
    raise AuthenticationError unless valid_password

    token = AuthenticationService.generate_token(user.email)
    render json: { token:, email: user.email, name: user.name }
  end

  def invalid_credentials
    render json: { errors: ['Invalid credentials'] }, status: :unauthorized
  end
end
