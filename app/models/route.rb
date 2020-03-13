class Route < ApplicationRecord
  belongs_to :user
  has_many :nodes, dependent: :destroy
  has_many :events, dependent: :destroy

  def define_nodes(distance)
    init = nodes.find_by_name("Initial_node")
    dir = [[1,1,1,1],[-1,-1,-1,-1],[-1,-1,1,1],[1,1,-1,-1]].sample
    margin1 = rand(-0.0005..0.0005)
    margin2 = rand(-0.0001..0.0001)
    long = init.longitude
    lat = init.latitude
    nodes.find_by_name("T1.1").update(longitude: long + margin1 + 0.0012 * distance * dir[0], latitude: lat - margin2)
    nodes.find_by_name("T1.2").update(longitude: long - margin1 + 0.0012 * distance * dir[1], latitude: lat + margin2 + 0.002 * distance * dir[2])
    nodes.find_by_name("T1.3").update(longitude: long, latitude: lat + 0.002 * distance * dir[3])
    nodes
  end

  def display_time
    hours = self.time / 60
    time = self.time % 60
    hour_string = hours > 0 ? "#{hours} hr" : ""
    hour_string + "#{time} min"
  end
  
  def display_distance
    self.distance < 1000 ? "#{distance} meters" : "#{(distance / 1000.0).round(1)} kilometers"
  end

  def build_google
    "https://www.google.com/maps/dir/?api=1&origin=#{self.nodes.find_by_name("Initial_node").latitude},#{self.nodes.find_by_name("Initial_node").longitude}&destination=#{self.nodes.find_by_name("Initial_node").latitude},#{self.nodes.find_by_name("Initial_node").longitude}&travelmode=bicycling&waypoints=#{self.nodes.find_by_name("T1.1").latitude},#{self.nodes.find_by_name("T1.1").longitude}%7C#{self.nodes.find_by_name("T1.2").latitude},#{self.nodes.find_by_name("T1.2").longitude}%7C#{self.nodes.find_by_name("T1.3").latitude},#{self.nodes.find_by_name("T1.3").longitude}&zoom=14"
  end

  def starting
    return nodes.first.address.length > 16 ? "#{nodes.first.address.upcase.first(14)}..." : nodes.first.address.upcase;
  end

  def ending
    if self.form == "Circular"
      return nodes.first.address.upcase.length > 16 ? "#{nodes.first.address.upcase.first(14)}..." : nodes.first.address.upcase;
    else
      return nodes.last.address.upcase.length > 16 ? "#{nodes.last.address.upcase.first(14)}..." : nodes.last.address.upcase;
    end
  end


  def calculate_distance
    @paths = []
      @route = self
      @nodes = self.nodes
      @markers = []
      @nodes.each do |node|
        @markers << {
          lat: node.latitude,
          lng: node.longitude
        } if node.real
      end
      distance = 0
      time = 0
      if self.form == "Circular"
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
      self.distance = distance.round(1)
      self.time = (time / 40).round
      self.save
  end

end
