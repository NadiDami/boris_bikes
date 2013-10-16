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