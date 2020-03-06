class UsersController < ApplicationController

  def show
    participants = Participant.where(user: current_user)
    @participants = participants.map { |participant| Route.find(participant.id) }.uniq
    @routes = current_user.routes
    @events = Event.all
  end

  def edit

  end

  def update

  end

  def delete

  end
end
