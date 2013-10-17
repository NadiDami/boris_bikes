require_relative 'bike_container'

class Garage

  include BikeContainer

  def initialize(bikes = [], capacity = 30)
    @bikes = bikes
    @capacity = capacity
  end

end