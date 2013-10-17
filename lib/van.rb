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

  def deliver_broken_bikes
   @bikes.reject! { |bike| bike.broken? }
  end

  def load_fixed_bikes_from garage
    @bikes += garage.release_fixed_bikes
  end

  def release_fixed_bikes
    @bikes.reject! { |bike| !bike.broken? }
  end

end