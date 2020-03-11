class FriendsController < ApplicationController

  def index
    @friends = Friend.all
  end

  end

  def show
    participant = User.find(params[:id])
    @events = participant.events_joined
    @routes = participant.routes
    @event = Event.new
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
