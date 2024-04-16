module AuthenticationService
  class JsonWebToken
    SECRET = ENV['JWT_SECRET']
    ALGORITHM = 'HS256'

    def self.encode(payload)
      payload[:exp] = Time.now.to_i + 7.days.to_i
      JWT.encode payload, SECRET, ALGORITHM
    end

    def self.decode(token)
      JWT.decode token, SECRET, true, { algorithm: ALGORITHM }
    rescue JWT::InvalidIssuerError, JWT::DecodeError
      [{ error: 'Invalid token' }]
    end
  end
end
