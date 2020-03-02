class RoutesController < ApplicationController
  belongs_to :path
  belongs_to :user

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    user = User.find(params[:user_id])
    path = Path.find(params[:path_id])
    @route.user = @user
    @route.path = @path
    if @route.save
      redirect_to path_path(@path)
    else
      render :new

  end

  def edit

  end

  def update

  end

  def delete

  end

    private

  def route_params
    params.require(:route).permit(:distance, :type)
  end
end
