class RoutesController < ApplicationController

  def new
    @route = Route.new
  end

  def create
    newroute = Route.create!(user: User.first)
    init = Node.create!(name: "Max's house", route: newroute, real:true, address: "SW18 1PS")
    long = init.longitude
    lat = init.latitude
    Node.create!(name: "T1.1", route: newroute, real: false, longitude: long + 0.006, latitude: lat)
    Node.create!(name: "T1.2", route: newroute, real: false, longitude: long + 0.006, latitude: lat + 0.01)
    Node.create!(name: "T1.3", route: newroute, real: false, longitude: long, latitude: lat + 0.01)
    # Node.create!(name: "T1.4", route: newroute, real: false, longitude: long+0.006, latitude: lat)
    # Node.create!(name: "Le Wagon", address: "E2 8DY", route: Route.first, real: true)
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
