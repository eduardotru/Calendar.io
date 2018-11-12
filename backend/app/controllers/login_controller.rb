class LoginController < ApplicationController

  def index
    if (User.where(username: user_params[:username], password: user_params[:password]).ids.blank?)
      json_response(-1)
    else
      json_response(User.where(username: user_params[:username], password: user_params[:password]).ids )
    end
  end

  def user_params
    params.permit(:username,
                  :password)
  end
end
