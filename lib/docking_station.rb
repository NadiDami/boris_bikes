class DockingStation

  def initialize(capacity = 10)
    @capacity = capacity 
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def dock bike
    raise "Station is full" if full?
    @bikes << bike
  end

  def release 
    @bikes.pop
  end

  def full?
    bike_count == @capacity 
  end

  def available_bikes
    @bikes.reject { |bike| bike.broken? }
  end


end