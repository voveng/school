class JsonWebToken
  SEKRET_KEY = ENV['JWT_SECRET_KEY']
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SEKRET_KEY)
  end

  def self.decode(token)
    JWT.decode(token, SEKRET_KEY)[0]
  rescue JWT::DecodeError
    nil
  end
end
