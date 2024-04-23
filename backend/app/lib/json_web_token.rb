class JsonWebToken
  SECRET_KEY = ENV['SECRET']
  ALGORITHM = 'HS256'

  def self.encode(payload)
    one_week = 60 * 60 * 24 * 7
    expiration_time = Time.now.to_i + one_week
    payload[:exp] = expiration_time
    JWT.encode payload, SECRET_KEY, ALGORITHM
  end

  def self.decode(token)
    JWT.decode(token, SECRET_KEY)
  end
end
