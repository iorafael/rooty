class UsersController < ApplicationController

  def show
    @routes = current_user.routes
    @events = current_user.routes
  end

  def edit

  end

  def update

  end

  def delete

  end
end
