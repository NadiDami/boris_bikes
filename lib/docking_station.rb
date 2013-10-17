require_relative 'bike_container'

class DockingStation

  include BikeContainer

  def initialize(bikes = [], capacity = 10)
    @bikes = bikes
    @capacity = capacity 
  end


  def release_broken_bikes
    @bikes.reject! { |bike| bike.broken? }
  end

  def accept_fixed_bikes_from van
    @bikes += van.release_fixed_bikes_to self
  end

end