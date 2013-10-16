require 'van'

describe Van do 

  let(:bike) {Bike.new}
  let(:van) {Van.new}
  let(:station) {DockingStation.new}

it 'accepts a bike from the station' do
  expect(van.bike_count).to eq 0
  expect(station).to receive(:release).and_return :bike
  van.load_bike_from(station)
  expect(van.bike_count).to eq 1
end

# it 'releases a bike to the station' do
#   van.load_bike_from(station)
#   expect(van.bike_count).to eq 1
#   expect(station).to receive(:dock => :bike)
#   van.return_bike_to(station)
#   expect(van.bike_count).to eq 0 
# end


end