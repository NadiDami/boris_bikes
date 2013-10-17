require 'docking_station'
require_relative 'bike_container_spec'

describe DockingStation do

  it_behaves_like 'a bike container'

  let(:bike) { double :bike, broken?: false } #ask about syntax 
  let(:broken_bike) {double :broken_bike, broken?: true} 
  let(:station) { DockingStation.new([], 20) }



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