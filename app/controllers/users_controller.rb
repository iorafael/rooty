class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    participants = Participant.where(user: current_user)
    @events = participants.map { |participant| Event.find(participant.id) }.uniq
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
