class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    redirect_to profile_path if current_user == @user
    @events = @user.events_joined
    @routes = @user.routes
  end

  def edit
  end

  def update

  end

  def delete

  end

end
