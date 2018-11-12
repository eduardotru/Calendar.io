class LoginController < ApplicationController

  def index
    json_response(User.where(username: user_params[:username]).ids)
  end

  def user_params
    params.permit(:username)
  end
end
