class RoutesController < ApplicationController

  def new
    @route = Route.new
  end

  def index
    @route = Route.new(route_params)
    user = User.find(params[:user_id])
    @route.user = @user
    if @route.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @paths = []
    @route = Route.find(params[:id])
    @nodes = @route.nodes
    @nodes.each_with_index do |node, index|
      response = RestClient.get "https://api.mapbox.com/directions/v5/mapbox/walking/#{node.longitude},#{node.latitude};#{@nodes[index-1].longitude},#{@nodes[index-1].latitude}?geometries=geojson&access_token=#{ENV['MAPBOX_API_KEY']}"
      repos = JSON.parse(response) # => repos is an `Array` of `Hashes`.
      @paths << (repos['routes'].first['geometry']['coordinates'])
    end
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
