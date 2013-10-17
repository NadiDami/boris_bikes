require_relative 'bike_container'

class Garage

  include BikeContainer

  def initialize(bikes = [], capacity = 30)
    @bikes = bikes
    @capacity = capacity
  end


  def load_broken_bikes_from van
    @bikes.concat(van.deliver_broken_bikes)
  end

  def fix_bikes
    @bikes.map { |bike| bike.fix!}
  end



end