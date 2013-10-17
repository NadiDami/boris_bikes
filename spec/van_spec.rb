require 'van'
require_relative 'bike_container_spec'

describe Van do

  it_behaves_like 'a bike container'

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

  it 'delivers broken bikes to the garage' do
    van.dock broken_bike
    expect(van.bike_count).to eq 1
    van.deliver_broken_bikes
    expect(van.bike_count).to eq 0
  end

  it 'accepts fixed bikes from the garage' do
    expect(van.bike_count).to eq 0
    expect(garage).to receive(:release_fixed_bikes).and_return([bike])
    van.load_fixed_bikes_from garage
    expect(van.bike_count).to eq 1
  end

  it 'delivers fixed bikes to the station' do
    van.dock bike
    van.release_fixed_bikes
    expect(van.bike_count).to eq 0
  end




end

 