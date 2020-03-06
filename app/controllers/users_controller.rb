class UsersController < ApplicationController

  def show
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
