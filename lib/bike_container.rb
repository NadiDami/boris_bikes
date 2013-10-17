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

end