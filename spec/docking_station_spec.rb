require 'docking_station'
require_relative 'bike_container_spec'

describe DockingStation do

  it_behaves_like 'a bike container'

  let(:bike) { double :bike, broken?: false } #ask about syntax 
  let(:broken_bike) {double :broken_bike, broken?: true} 
  let(:van) {double :van}
  let(:station) { DockingStation.new}

  it 'releases only broken bikes to a van' do
    station = DockingStation.new([bike, broken_bike], 2)
    station.release_broken_bikes
    expect(station.broken_bikes).to eq []

  end

  it 'accepts only fixed bikes from the van' do
    expect(station.working_bikes).to eq []
    van = double :van, {:dock => :bike}
    van.dock bike
    van.dock broken_bike
    expect(van).to receive(:release_fixed_bikes).and_return [bike]
    station.accept_fixed_bikes_from(van)
    expect(station.working_bikes).to eq [bike]
  end




end 