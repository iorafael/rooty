class UsersController < ApplicationController

  def index
    if params[:query].blank?
      @users = User.all
    else
      @users = User.search_by_name_lastname_username(params[:query])
    end
  end

  def show
    participants = Participant.where(user: current_user)
    @events = current_user.events_joined
    @routes = current_user.routes
    @event = Event.new
  end

  def edit
  end

  def update

  end

  def delete

  end

end
