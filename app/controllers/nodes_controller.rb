class NodesController < ApplicationController
    def create
        newroute = Route.create!(user: current_user)
        init = Node.create!(name: "Max's house", route: newroute, real:true, address: params[:node][:address])
        long = init.longitude
        lat = init.latitude
        Node.create!(name: "T1.1", route: newroute, real: false, longitude: long + 0.006, latitude: lat)
        Node.create!(name: "T1.2", route: newroute, real: false, longitude: long + 0.006, latitude: lat + 0.01)
        Node.create!(name: "T1.3", route: newroute, real: false, longitude: long, latitude: lat + 0.01)
        # Node.create!(name: "T1.4", route: newroute, real: false, longitude: long+0.006, latitude: lat)
        # Node.create!(name: "Le Wagon", address: "E2 8DY", route: Route.first, real: true)
    end

end
