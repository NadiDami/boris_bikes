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
    broken_bikes = @bikes.select { |bike| bike.broken? }
    broken_bikes.each {|bike| garage.dock bike}
    @bikes = self.working_bikes
  end

  def load_fixed_bikes_from garage
    @bikes = garage.release_working_bikes
  end

  def release_fixed_bikes_to station
    working_bikes = @bikes.reject { |bike| bike.broken? }
    working_bikes.each {|bike| station.dock bike}
    @bikes = self.broken_bikes
  end

end