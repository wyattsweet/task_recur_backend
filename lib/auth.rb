class Auth
  class << self
    ALGORITHM = 'HS256'
    def issue(user_id)
      exp = Time.now + 7 * 86400
      payload = { user: user_id, exp: exp }
      JWT.encode(
        payload,
        auth_secret,
        ALGORITHM
      )
    end

    def decode(token)
      JWT.decode(token, auth_secret, true, {algorithm: ALGORITHM})
    end
    
    private

    def auth_secret
      ENV['AUTH_SECRET']
    end
  end
end
