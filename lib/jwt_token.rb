# lib/jwt_token.rb
require "jwt"

class JsonWebToken
    SECRET_KEY = "1234"
  
    def self.encode(payload)
      # payload[:timestamp] = Time.now.inspect
      JWT.encode(payload, SECRET_KEY, 'HS256', { typ: 'JWT' })
    end
  
    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY, true, { algorithm: 'hs256' })[0]
      decoded
    end
end

