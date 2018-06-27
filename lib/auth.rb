class Auth
  algorithm = 'HS256'
  class << self
    def issues(payload)
      JWT.encode(
        payload,
        auth_secret,
        algorithm
      )
    end

    def decode(token)
      JWT.decode(token, auth_secret, true, {algorithm: algorithm})
    end
    
    private

    def auth_secret
      ENV['AUTH_SECRET']
    end
  end
end
