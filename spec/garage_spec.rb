require 'garage'
require_relative 'bike_container_spec'

describe Garage do

  it_behaves_like 'a bike container'

  let(:garage) {Garage.new}
  let(:bike) { double :bike, broken?: false }
  let(:van) {double :van}
  let(:broken_bike) {double :broken_bike, broken?: true} 


  it 'fixes bikes' do
    garage = Garage.new([broken_bike], 10)
    expect(broken_bike).to receive(:fix!)
    garage.fix_bikes
  end



end