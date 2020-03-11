class FriendsController < ApplicationController

  def index
    @friends = Friend.all
  end

  def show
    participant = User.find(params[:id])
    @events = participant.events_joined
    @routes = participant.routes
    @event = Event.new
  end

  def create
    friend = Friend.new(user_id: current_user.id, user_friend_id: params[:user_id])
    @user = User.find(params[:user_id])
    if friend.save
      flash[:notice] = "Added friend."
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    else
      flash[:error] = "Unable to add friend."
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    end
  end

  def update
    @friend = Friend.where(user_id: params[:id]).where(user_friend_id: current_user.id)[0]
    if @friend
      @friend.accept
      respond_to do |format|
        format.html { redirect_to profile_path }
        format.js
      end
    else
      flash[:error] = "Unable to accept friend: The friend request was revoked"
      respond_to do |format|
        format.html { redirect_to profile_path }
        format.js
      end
    end
  end

  def destroy
   @friend = current_user.friend.find(params[:id])
   @friend.destroy
   flash[:notice] = "Removed friend."
   redirect_to current_user
  end

  def friend_params
   params.require(:friend).permit(:user_friend_id, :user_id)
  end
end
