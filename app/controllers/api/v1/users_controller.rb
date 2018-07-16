module Api::V1
  class UsersController < ApplicationController
    before_action :authenticate, only: [:index, :show]
    def index
      binding.pry
      @users = get_users
      render :json => { users: @users }
    end

    def show
      # return the current_user
    end

    def create
      user = User.create(new_user_params)
      if user.valid?
        jwt = Auth.issue(user.id)
        render :json => { jwt: jwt }
      else
        render status: 400, json: {
          message: user.errors.full_messages
        }
      end
    end

    private

    def new_user_params
      params.permit(:email, :password)
    end

    def get_users
      @user = User.all.select(:id, :email, :name)
    end
  end
end
