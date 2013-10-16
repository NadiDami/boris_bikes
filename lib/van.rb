class Van

  def initialize bikes = []
    @bikes = bikes
  end

  def bike_count
    @bikes.count
  end

  def load_broken_bikes_from station
    @bikes += station.release_broken_bikes
  end

  def deliver_broken_bikes 
   @bikes.reject! { |bike| bike.broken? }
  end


  

  # def return_bike_to station
  #   station.dock @bikes[0]
  # end

end