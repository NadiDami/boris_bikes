require_relative 'bike_container'

class Van

  include BikeContainer

  def initialize(bikes = [], capacity = 5)
    @bikes = bikes
    @capacity = capacity
  end

  def load_broken_bikes_from station
    @bikes += station.release_broken_bikes
  end

  def deliver_broken_bikes garage
    garage.dock_broken_bikes @bikes.delete { |bike| bike.broken? }

  end

end