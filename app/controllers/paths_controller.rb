class PathsController < ApplicationController
  has_many :routes

  def index
    @paths = Path.all
  end

  def new
    @path = Path.new
  end

  def create
    user = User.find(params[:user_id])

  end

  def edit

  end

  def update

  end

  def delete

  end
end
