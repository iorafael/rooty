class FriendsController < ApplicationController

  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def create
    @friend = Friend.new
    @friend.user = current_user
    @user = User.find(params[:user_id])
    @friend.user = @user
    if @friend.save
      redirect_to @user
    else
      render 'users/show'
    end
  end

  def destroy
    friend = Friend.find(params[:friend_id])
    friend.destroy
    user = params[:user_id]
    redirect_to user_path(user)
  end
end
