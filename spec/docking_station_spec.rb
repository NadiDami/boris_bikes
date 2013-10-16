require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike, broken?: false } #ask about syntax 
  let(:broken_bike) {double :broken_bike, broken?: true} 
  let(:station) { DockingStation.new(20) }

  it 'accepts a bike' do
    expect(station.bike_count).to eq 0
    station.dock(bike)
    expect(station.bike_count).to eq 1
  end

  it 'releases a bike' do
    station.dock(bike)
    station.release
    expect(station.bike_count). to eq 0
  end

  it "knows when it's full" do
    expect(station).not_to be_full
    20.times { station.dock(bike) }
    expect(station).to be_full
  end

  it "does not accept a bike if it's full" do
    20.times { station.dock(bike) }
    expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)
  end

  it 'provides the list of working bikes' do
    station.dock bike 
    station.dock broken_bike
    expect(station.working_bikes).to eq ([bike])
  end

  it 'provides the list of broken bikes' do
    station.dock bike
    station.dock broken_bike
    expect(station.broken_bikes).to eq ([broken_bike])
  end

  it 'provides the number of working bikes' do
    station.dock bike
    station.dock broken_bike
    expect(station.working_bike_count).to eq 1
  end

  it 'provides the number of broken bikes' do
    station.dock bike
    station.dock broken_bike
    expect(station.broken_bike_count).to eq 1
  end



end 