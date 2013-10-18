module BikeContainer


  def dock bike
    raise "No more bike space" if full?
    @bikes << bike
  end

  def bike_count
    @bikes.count
  end

  def full?
    bike_count == @capacity 
  end

  def release 
    @bikes.pop
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

   def release_broken_bikes
    broken = broken_bikes
    @bikes = self.working_bikes
    broken
  end

  def release_working_bikes
    working = working_bikes
    @bikes = self.broken_bikes
    working
  end


end