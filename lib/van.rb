require_relative 'bike_container'

class Van

  include BikeContainer

  def initialize(bikes = [], capacity = 5)
    @bikes = bikes
    @capacity = capacity
  end

  def load_broken_bikes_from station
    @bikes.concat(station.release_broken_bikes) 
  end

  def deliver_broken_bikes_to garage
   garage.dock(@bikes.select! { |bike| bike.broken? })
  end

  def load_fixed_bikes_from garage
    @bikes.concat(garage.working_bikes) 
  end

  def release_fixed_bikes_to station
    station.dock(@bikes.reject! { |bike| !bike.broken? })
  end

end