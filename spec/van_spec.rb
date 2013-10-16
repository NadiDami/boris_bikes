require 'van'

describe Van do 

  let(:van) {Van.new}
  let(:bike) {double :bike, broken?: false}
  let(:broken_bike) {double :broken_bike, broken?: true}
  let(:broken_bike2) {double :broken_bike, broken?: true}
  let(:station) {double :station} 
  let (:garage) {double :garage}

it 'accepts broken bikes from the station' do
  station = double :station, {:dock => :bike}
  station.dock bike
  station.dock broken_bike
  station.dock broken_bike2
  expect(van.bike_count).to eq 0
  expect(station).to receive(:release_broken_bikes).and_return([broken_bike, broken_bike2])
  van.load_broken_bikes_from station
  expect(van.bike_count).to eq 2
end

  it 'can remove broken bikes from itself' do
  
  
    van = Van.new [broken_bike, broken_bike2, bike]
    expect(van.bike_count).to eq 3
    van.deliver_broken_bikes 
    expect(van.bike_count).to eq 1
  end

# it 'delivers broken bikes to the garage' do
#   broken_bike2 = double :broken_bike
#   broken_bike3 = double :broken_bike  
#   bikes = [broken_bike, broken_bike2, broken_bike3, bike]
#   van = Van.new bikes
#   expect(van.bike_count).to eq 4
#   van.deliver_broken_bikes_to garage
  
#   expect(van.bike_count).to eq 1
# end

# it 'releases a fixed bike to the station' do
#   bike.break!
#   station.dock bike
#   van.lead_broken_bikes_from station
#   expect(van.bike_count).to eq 1
#   bike.fix!

# end

# it 'releases a bike to the station' do
#   van.load_bike_from(station)
#   expect(van.bike_count).to eq 1
#   expect(station).to receive(:dock => :bike)
#   van.return_bike_to(station)
#   expect(van.bike_count).to eq 0 
# end


end

 # it 'provides the list of available bikes' do
 #    working_bike, broken_bike = Bike.new, Bike.new
 #    broken_bike.break!
 #    station.dock(working_bike)
 #    station.dock(broken_bike)
 #    expect(station.available_bikes).to eq ([working_bike])
 #  end