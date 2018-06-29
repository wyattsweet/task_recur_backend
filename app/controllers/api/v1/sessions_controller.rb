module Api::V1
  class SessionsController < ApplicationController
    before_action :find_user, only: [:create]

    attr_reader :user

    def create
      binding.pry
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
      user.authenticate(params[:password])
    end

    def find_user
      @user = User.find_by(email: params[:email])
    end
  end
end
