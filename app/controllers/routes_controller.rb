class RoutesController < ApplicationController

  def new
    @route = Route.new
  end

  def create
  
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
      response = RestClient.get "https://api.mapbox.com/directions/v5/mapbox/cycling/#{node.longitude},#{node.latitude};#{@nodes[index-1].longitude},#{@nodes[index-1].latitude}?geometries=geojson&exclude=ferry&access_token=#{ENV['MAPBOX_API_KEY']}"
      repos = JSON.parse(response) # => repos is an `Array` of `Hashes`.
      @paths << (repos['routes'].first['geometry']['coordinates'])
    end
  end

  def edit
    newroute = Route.find(params[:id])
    distance = params[:node][:distance] ? params[:node][:distance] : 5
    init = newroute.nodes.first
    dir = [[1,1,1,1],[-1,-1,-1,-1],[-1,-1,1,1],[1,1,-1,-1]].sample
    margin1 = rand(-0.0005..0.0005)
    margin2 = rand(-0.0001..0.0001)
    long = init.longitude
    lat = init.latitude
    Node.update!(name: "T1.1", route: newroute, real: false, longitude: long + margin1 + 0.0012 * distance * dir[0], latitude: lat - margin2)
    Node.update!(name: "T1.2", route: newroute, real: false, longitude: long - margin1 + 0.0012 * distance * dir[1], latitude: lat + margin2 + 0.002 * distance * dir[2])
    Node.update!(name: "T1.3", route: newroute, real: false, longitude: long, latitude: lat + 0.002 * distance * dir[3])
    redirect_to root_path(route: newroute.id)
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
