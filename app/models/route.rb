class Route < ApplicationRecord
  belongs_to :user
  has_many :nodes, dependent: :destroy
  has_many :events, dependent: :destroy

  def define_nodes(distance)
    init = self.nodes.find_by_name("Max's house")
    dir = [[1,1,1,1],[-1,-1,-1,-1],[-1,-1,1,1],[1,1,-1,-1]].sample
    margin1 = rand(-0.0005..0.0005)
    margin2 = rand(-0.0001..0.0001)
    long = init.longitude
    lat = init.latitude
    self.nodes.find_by_name("T1.1").update(longitude: long + margin1 + 0.0012 * distance * dir[0], latitude: lat - margin2)
    self.nodes.find_by_name("T1.2").update(longitude: long - margin1 + 0.0012 * distance * dir[1], latitude: lat + margin2 + 0.002 * distance * dir[2])
    self.nodes.find_by_name("T1.3").update(longitude: long, latitude: lat + 0.002 * distance * dir[3])
    self.save
  end

  def display_time
    hours = self.time / 60
    time = self.time % 60
    hour_string = hours > 0 ? "#{hours} hr" : ""
    hour_string + "#{time} min"
  end
  
  def display_distance
    self.distance < 1000 ? "#{distance} meters" : "#{distance / 1000.0} kilometers"
  end
end
