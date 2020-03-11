class UsersController < ApplicationController

  def index
    if params[:query].blank?
      @users = User.all
    else
      @users = User.search_by_name_lastname_username(params[:query])
    end
  end

  def show
    authorize current_user
    @user = User.find(params[:id])
    redirect_to profile_path if current_user == @user
    @events = @user.events_joined
    @routes = @user.routes
    @request_sent = Friend.where(user_id: current_user).where(user_friend_id: params[:id])[0] 
    @request_received = Friend.where(user_id: params[:id]).where(user_friend_id: current_user)[0]
  end

  def edit
  end

  def update

  end

  def delete

  end

end
