class AuthenticationService
  HMAC_SECRET = 'ec134bf7bda5122d29862f52ad6b236cf1df33b75f6bf78aa3b1573cf665dbe0'.freeze
  ALGORITHM_HASH = 'HS256'.freeze

  def self.generate_token(payload)
    expires_in = Time.now.to_i + (60 * 60 * 24 * 7) # Expires in 1 week from now
    exp_payload = { data: payload, exp: expires_in }
    JWT.encode exp_payload, HMAC_SECRET, ALGORITHM_HASH
  end

  def self.verify_token(token)
    JWT.decode token, HMAC_SECRET, true, { algorithm: ALGORITHM_HASH }
  rescue JWT::InvalidIssuerError, JWT::DecodeError
    [{ error: 'Invalid token' }]
  end
end
