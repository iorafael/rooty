class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :intro]

  def intro
    @new_node = Node.new
  end

  def home
    @new_node = Node.new
    count = 0
    if params[:route]
      @route = Route.find(params[:route])
      calculate_distance(@route)
      while (@route.distance < (distance*1000-1000) || @route.distance > (distance*1000 + 1000)) && count < 10
        @route.define_nodes(5)
        calculate_distance(@route.reload)
        count += 1
      end
      if count > 9
        flash[:notice] = 'Address not found, please be more specific!'
        redirect_to map_path
      end
    else
      @paths = []
      @nodes = [{longitude: -122.486052, latitude: 37.830348}]
      @route = nil
    end
  end

  def profile
    participants = Participant.where(user: current_user)
    @events = current_user.events_joined
    @routes = current_user.routes
    @event = Event.new
    @requests = current_user.friend_requests
    @friends = Friend.all
  end

  private

  def calculate_distance(route)
    @paths = []
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
      time = 0
      if route.form == "Circular"
        @nodes.each_with_index do |node, index|
          response = RestClient.get "https://api.mapbox.com/directions/v5/mapbox/cycling/#{@nodes[index-1].longitude},#{@nodes[index-1].latitude};#{node.longitude},#{node.latitude}?geometries=geojson&exclude=ferry&access_token=#{ENV['MAPBOX_API_KEY']}"
          repos = JSON.parse(response) # => repos is an `Array` of `Hashes`.
          node.distance = repos['routes'].first['distance']
          node.time = repos['routes'].first['duration']
          distance += node.distance
          time += node.time
          node.save!
          @paths << (repos['routes'].first['geometry']['coordinates'])
        end
      else
        number = 1
        while number < @nodes.length do
          response = RestClient.get "https://api.mapbox.com/directions/v5/mapbox/cycling/#{@nodes[number-1].longitude},#{@nodes[number-1].latitude};#{@nodes[number].longitude},#{@nodes[number].latitude}?geometries=geojson&exclude=ferry&access_token=#{ENV['MAPBOX_API_KEY']}"
          repos = JSON.parse(response) # => repos is an `Array` of `Hashes`.
          @nodes[number].distance = repos['routes'].first['distance']
          @nodes[number].save!
          distance += @nodes[number].distance
          @nodes[number].time = repos['routes'].first['duration']
          time += @nodes[number].time
          @paths << (repos['routes'].first['geometry']['coordinates'])
          number += 1
        end
      end
      route.distance = distance.round(1)
      route.time = (time / 40).round
      route.save
  end
end
