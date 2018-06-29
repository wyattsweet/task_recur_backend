class ApplicationController < ActionController::API

  def authenticate
    render json: { message: 'unauthorized' }, status: 401 unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    if auth_present?
      user = User.find(auth[0]['user'])

      if user
        @current_user ||= user
      end
    end
  end

  def auth_present?
    !!request.env.fetch('HTTP_AUTHORIZATION', "").scan(/Bobcats/).flatten.first
  end

  def auth
    Auth.decode(token)
  end

  def token
    request.env['HTTP_AUTHORIZATION'].scan(/Bobcats(.*)$/).flatten.last
  end
end
