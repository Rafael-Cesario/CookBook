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
    return unless token

    valid_token = JsonWebToken.decode(token)

    return unless valid_token[0].has_key?(:error)
    render json: INVALID_TOKEN, status: :unauthorized
  end

  def token_from_request
    authorization_header_elements = request.headers['Authorization']&.split

    unless authorization_header_elements
      render json: REQUIRES_AUTHENTICATION, status: :unauthorized
      return
    end

    unless authorization_header_elements.length == 2
      render json: MALFORMED_AUTHORIZATION_HEADER, status: :unauthorized
      return
    end

    scheme, token = authorization_header_elements

    unless scheme.downcase == 'bearer'
      render json: BAD_CREDENTIALS, status: :unauthorized
      return
    end

    token
  end
end
