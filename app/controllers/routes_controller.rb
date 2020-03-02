class RoutesController < ApplicationController
  belongs_to :user

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    user = User.find(params[:user_id])
    @route.user = @user
    if @route.save
      redirect_to user_path(@user)
    else
      render :new
  end

  def edit

  end

  def delete
    @route = Route.find(params[:id])
    @route.destroy
    redirect_to path_path(@route.path)
  end

    private

  def route_params
    params.require(:route).permit(:distance, :type)
  end
end
