class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @new_node = Node.new
    if params[:route]      
      @paths = []
      route = Route.find(params[:route])
      
      @nodes = route.nodes
      @markers = []
      @nodes.map do |node|
        @markers << {
          lat: node.latitude,
          lng: node.longitude
        } if node.real
      end
      @nodes.each_with_index do |node, index|
        response = RestClient.get "https://api.mapbox.com/directions/v5/mapbox/cycling/#{node.longitude},#{node.latitude};#{@nodes[index-1].longitude},#{@nodes[index-1].latitude}?geometries=geojson&exclude=ferry&access_token=#{ENV['MAPBOX_API_KEY']}"
        repos = JSON.parse(response) # => repos is an `Array` of `Hashes`.
        @paths << (repos['routes'].first['geometry']['coordinates'])
      end
    else
      @paths = []
      @nodes = [{longitude: -122.486052, latitude: 37.830348}]
    end
  end
end
