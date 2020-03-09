class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @new_node = Node.new
    if params[:route]      
      @paths = []
      route = Route.find(params[:route])
      @route = route
      @nodes = route.nodes
      @markers = []
      @nodes.each do |node|
        @markers << {
          lat: node.latitude,
          lng: node.longitude
        } if node.real
      end
      distance = 0
      if route.form == "Circular"
        @nodes.each_with_index do |node, index|
          response = RestClient.get "https://api.mapbox.com/directions/v5/mapbox/cycling/#{@nodes[index-1].longitude},#{@nodes[index-1].latitude};#{node.longitude},#{node.latitude}?geometries=geojson&exclude=ferry&access_token=#{ENV['MAPBOX_API_KEY']}"
          repos = JSON.parse(response) # => repos is an `Array` of `Hashes`.
          node.distance = repos['routes'].first['distance']
          distance += node.distance
          node.save!
          @paths << (repos['routes'].first['geometry']['coordinates'])
        end
        route.distance = distance
        route.save!

      else
        number = 1
        while number < @nodes.length do
          response = RestClient.get "https://api.mapbox.com/directions/v5/mapbox/cycling/#{@nodes[number-1].longitude},#{@nodes[number-1].latitude};#{@nodes[number].longitude},#{@nodes[number].latitude}?geometries=geojson&exclude=ferry&access_token=#{ENV['MAPBOX_API_KEY']}"
          repos = JSON.parse(response) # => repos is an `Array` of `Hashes`.
          @nodes[number].distance = repos['routes'].first['distance']
          @nodes[number].save!
          distance += @nodes[number].distance
          @paths << (repos['routes'].first['geometry']['coordinates'])
          number += 1
        end
        route.distance = distance
        route.save!
      end
    else
      @paths = []
      @nodes = [{longitude: -122.486052, latitude: 37.830348}]
      @route = nil
    end
  end
end
