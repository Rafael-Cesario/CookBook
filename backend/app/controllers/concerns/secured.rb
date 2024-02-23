module Secured
  extend ActiveSupport::Concern
  include AuthenticationService

  REQUIRES_AUTHENTICATION = { message: 'Requires authentication' }.freeze
  BAD_CREDENTIALS = { message: 'Bad credentials' }.freeze
  INVALID_TOKEN = { errors: ["authorization: Invalid credentials"] }

  MALFORMED_AUTHORIZATION_HEADER = {
    error: 'invalid_request',
    error_description: 'Authorization header value must follow this format: Bearer access-token',
    message: 'Bad credentials'
  }.freeze

  def authorize
    token = token_from_request
    valid_token = JsonWebToken.decode(token)
    render json: INVALID_TOKEN, status: :unauthorized and return unless valid_token[:errors].empty?
  end

  def token_from_request
    authorization_header_elements = request.headers['Authorization']&.split

    render json: REQUIRES_AUTHENTICATION, status: :unauthorized and return unless authorization_header_elements

    unless authorization_header_elements.length == 2
      render json: MALFORMED_AUTHORIZATION_HEADER, status: :unauthorized and return
    end

    scheme, token = authorization_header_elements

    render json: BAD_CREDENTIALS, status: :unauthorized and return unless scheme.downcase == 'bearer'

    token
  end
end
