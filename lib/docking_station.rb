require_relative 'bike_container'

class DockingStation

  include BikeContainer

  def initialize(bikes = [], capacity = 10)
    @bikes = bikes
    @capacity = capacity 
  end


  def working_bikes
    @bikes.reject { |bike| bike.broken? }
  end

  def broken_bikes
    @bikes.select { |bike| bike.broken? }
  end

  def working_bike_count
    working_bikes = @bikes.reject { |bike| bike.broken? }
    working_bikes.count
  end

  def broken_bike_count
    broken_bikes = @bikes.select { |bike| bike.broken? }
    broken_bikes.count
  end


end