require_relative 'bike_container'

class DockingStation

  include BikeContainer

  def initialize(bikes = [], capacity = 10)
    @bikes = bikes
    @capacity = capacity 
  end


  def release_broken_bikes
    broken = broken_bikes
    @bikes = self.working_bikes
    broken
  end

  def accept_fixed_bikes_from van
    @bikes.concat(van.release_fixed_bikes)
  end


end