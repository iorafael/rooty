class UsersController < ApplicationController

  def show
    participants = Participant.where(user: current_user)
    @events = participants.map { |participant| Event.find(participant.event.id) }.uniq
    @routes = current_user.routes
  end

  def edit

  end

  def update

  end

  def delete

  end
end
