require 'garage'
require_relative 'bike_container_spec'

describe Garage do

  it_behaves_like 'a bike container'

  let(:garage) {Garage.new}
  let(:bike) { double :bike, broken?: false }
  let(:van) {double :van}
  let(:broken_bike) {double :broken_bike, broken?: true} 

  it 'accepts broken bikes from the van' do
    expect(van).to receive(:deliver_broken_bikes).and_return [broken_bike]
    garage.load_broken_bikes_from van
  end

  it 'has a broken bike after accepting bikes from a van' do
    van = double :van, deliver_broken_bikes: [broken_bike]
    garage.load_broken_bikes_from van
    expect(garage.bike_count).to eq 1
  end


  it 'accepts fixed bikes from the garage' do
    
  end

  it 'fixes bikes' do
    garage = Garage.new([broken_bike], 10)
    expect(broken_bike).to receive(:fix!)
    garage.fix_bikes
  end

  # it 'returns fixed bikes to the van' do

  # end


end