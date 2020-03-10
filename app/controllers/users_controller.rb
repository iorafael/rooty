class UsersController < ApplicationController

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
