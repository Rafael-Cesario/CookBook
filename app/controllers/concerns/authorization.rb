# frozen_string_literal: true

module Authorization
  extend ActiveSupport::Concern

  REQUIRES_AUTHENTICATION = { message: 'Authentication header not found' }.freeze
  BAD_CREDENTIALS = { message: 'Bad credentials' }.freeze

  MALFORMED_AUTHORIZATION_HEADER = {
    error: 'invalid_request',
    error_description: 'Authorization header value must follow this format: Bearer access-token',
    message: 'Bad credentials'
  }.freeze

  def authorize
    token = token_from_request
    validate_token = AuthenticationService.verify_token(token)

    return unless validate_token[0].has_key?('error')

    render json: { error: validate_token[:error] }, status: :unauthorized
  end

  def token_from_request
    authorization_header = request.headers['Authorization']&.split

    render json: REQUIRES_AUTHENTICATION, status: :unauthorized and return unless authorization_header

    unless authorization_header.length == 2
      render json: MALFORMED_AUTHORIZATION_HEADER, status: :unauthorized and return
    end

    scheme, token = authorization_header
    render json: BAD_CREDENTIALS, status: :unauthorized and return unless scheme.downcase == 'bearer'

    token
  end
end
