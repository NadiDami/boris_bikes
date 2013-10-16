class Van

  def initialize
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def load_bike_from station
    @bikes << station.release
  end

  # def return_bike_to station
  #   station.dock @bikes[0]
  # end

end