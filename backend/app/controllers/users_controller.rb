class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    json_response(@users)
  end

  # POST /users
  def create
    @userNew = User.create!(user_params)
    json_response(@userNew)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # PUT /users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  def newFriend
    Friendship.create(user_id:params[:user_id], friend_id:params[:friend_id])
    Friendship.create(friend_id:params[:user_id], user_id:params[:friend_id])
  end

  def friendships
    json_response(Friendship.all.select(:user_id, :friend_id).where(user_id: params[:user_id]))
  end

  def findUsers
    if (User.where("username LIKE :userSearch", userSearch:"#{params[:username]}%").blank?)
      json_response(-1)
    else
      @allUsers = User.where("username LIKE :userSearch", userSearch:"#{params[:username]}%")
      @allFriends = Friendship.all.select(:friend_id).where(user_id: params[:user_id])
      # @allFriends.append(User.find(params[:user_id]))
      @noFriends = Array.new

      @allUsers.each do |u|
        @isFriend = false
        @allFriends.each do |f|
          if (f.friend_id == u.id)
            @isFriend = true
          end
        end
        if (!@isFriend)
          @noFriends.append(u)
        end
      end
      @noFriends.delete(User.find(params[:user_id]))
      json_response(@noFriends)
    end
  end

  def user_params
    # whitelist params
    params.permit(:firstname,
      :lastname,
      :username,
      :password,
      :phone,
      :email,
      :friend_id)
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
