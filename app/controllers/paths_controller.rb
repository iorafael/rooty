class PathsController < ApplicationController
  belongs_to :route
  def index
    @paths = Path.all
  end

  def new
    @path = Path.new
  end

  def create
    route = Route.find(params[:user_id])

  end

  def edit

  end

  def update

  end

  def delete

  end
end
