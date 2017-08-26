class UsersController < ApplicationController
  def whoami
    render json: current_user
  end
end
