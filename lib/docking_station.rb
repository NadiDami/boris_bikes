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

  def release bike
    @bikes.delete(bike)
  end

  def full?
    bike_count == @capacity 
  end

end