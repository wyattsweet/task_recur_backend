module Api::V1
  class UsersController < ApplicationController
    def index
      @users = get_users
      render :json => { users: @users }
    end

    def create
    end

    private

    def get_users
      User.all.select(:id, :email, :name)
    end
  end
end
