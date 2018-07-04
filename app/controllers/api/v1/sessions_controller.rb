module Api::V1
  class SessionsController < ApplicationController
    before_action :find_user, only: [:create]

    attr_reader :user

    def create
      if user_authenticate
        jwt = Auth.issue({user: user.id})
        render json: {jwt: jwt}
      else
        render status: 401, json: {
          message: 'unauthorized'
        }
      end
    end

    private

    def user_authenticate
      user.authenticate(user_params[:password])
    end

    def find_user
      @user = User.find_by(email: user_params[:email])
    end

    def user_params
      params.permit(:email, :password)
    end
  end
end
