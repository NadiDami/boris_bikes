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
    station = double :station, {:dock => :broken_bike}
    expect(station).to receive(:release_broken_bikes).and_return([broken_bike])
    van.load_broken_bikes_from station
  end

  it 'delivers broken bikes to the garage' do
    expect(garage).to receive(:dock)
    van.deliver_broken_bikes_to garage 
  end

  it 'accepts fixed bikes from the garage' do
    garage = double :garage, { working_bikes: [bike] }
    expect(garage).to receive(:working_bikes)
    van.load_fixed_bikes_from garage
  end

  it 'delivers fixed bikes to the station' do
    expect(station).to receive(:dock)
    van.release_fixed_bikes_to station
  end


end

 