class NodesController < ApplicationController
    def create
        distance = params[:node][:distance] ? params[:node][:distance] : 5
        newroute = Route.create!(user: current_user)
        init = Node.create!(name: "Max's house", route: newroute, real:true, address: params[:node][:address])
        if init.latitude    
            long = init.longitude
            lat = init.latitude
            Node.create!(name: "T1.1", route: newroute, real: false, longitude: long + 0.0012 * distance, latitude: lat)
            Node.create!(name: "T1.2", route: newroute, real: false, longitude: long + 0.0012 * distance, latitude: lat + 0.002 * distance)
            Node.create!(name: "T1.3", route: newroute, real: false, longitude: long, latitude: lat + 0.002 * distance)
            redirect_to root_path(route: newroute.id)
        else
            Node.last.delete
            Route.last.delete
            flash[:notice] = 'Address not found, please be more specific!'
            redirect_to root_path
        end
    end

end
