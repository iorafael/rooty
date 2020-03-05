class NodesController < ApplicationController
    def create
        distance = params[:node][:distance] ? params[:node][:distance] : 5
        newroute = Route.create!(user: current_user)
        @a = Node.create!(name: "Max's house", route: newroute, real:true, address: params[:node][:address])
        long = @a.longitude
        lat = @a.latitude
        b = Node.create!(name: "T1.1", route: newroute, real: false, longitude: long + 0.0012 * distance, latitude: lat)
        c = Node.create!(name: "T1.2", route: newroute, real: false, longitude: long + 0.0012 * distance, latitude: lat + 0.002 * distance)
        d = Node.create!(name: "T1.3", route: newroute, real: false, longitude: long, latitude: lat + 0.002 * distance)
        
        @paths = []
        @nodes = [@a,b,c,d]
        @markers = []
        @nodes.each do |node|
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



        respond_to do |format|
            format.html { redirect_to root_path(route: newroute.id) }
            format.js
        end
        
    end

end
