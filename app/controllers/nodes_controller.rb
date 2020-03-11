class NodesController < ApplicationController
    def create
        distance = params[:node][:distance] ? params[:node][:distance] : 5
        newroute = Route.create!(user: current_user)
        init = Node.create!(name: "Initial_node", route: newroute, real:true, address: params[:node][:address])
        if init.latitude
            dir = [[1,1,1,1],[-1,-1,-1,-1],[-1,-1,1,1],[1,1,-1,-1]].sample
            margin1 = rand(-0.0005..0.0005)
            margin2 = rand(-0.0001..0.0001)
            long = init.longitude
            lat = init.latitude
            Node.create!(name: "T1.1", route: newroute, real: false, longitude: long + margin1 + 0.0012 * distance * dir[0], latitude: lat - margin2)
            Node.create!(name: "T1.2", route: newroute, real: false, longitude: long - margin1 + 0.0012 * distance * dir[1], latitude: lat + margin2 + 0.002 * distance * dir[2])
            Node.create!(name: "T1.3", route: newroute, real: false, longitude: long, latitude: lat + 0.002 * distance * dir[3])
            redirect_to map_path(route: newroute.id)
        else
            Node.last.delete
            Route.last.delete
            flash[:notice] = 'Address not found, please be more specific!'
            redirect_to map_path
        end
    end

end
